package sd.assignment_1_sd.controller;

import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.text.Text;
import javafx.stage.StageStyle;
import sd.assignment_1_sd.dto.DestinationDTO;
import sd.assignment_1_sd.dto.VacationPackageDTO;
import sd.assignment_1_sd.entity.VacationPackage;
import sd.assignment_1_sd.service.DestinationService;
import sd.assignment_1_sd.service.VacationPackageService;

import java.time.LocalDate;
import java.util.List;


public class TravellingAgencyController {
    private final VacationPackageService vacationPackageService = new VacationPackageService();
    private final DestinationService destinationService = new DestinationService();

    @FXML
    private TabPane tabPane;

    @FXML
    private TableView<VacationPackageDTO> vacationPackagesTableView = new TableView();

    @FXML
    private TableView<DestinationDTO> destinationsTableView = new TableView();

    @FXML
    private ChoiceBox<String> destinationChoiceBox = new ChoiceBox();

    @FXML
    private DatePicker startDatePicker = new DatePicker();

    @FXML
    private DatePicker endDatePicker = new DatePicker();

    @FXML
    private TextField packageNameTextField = new TextField();

    @FXML
    private TextField priceTextField = new TextField();

    @FXML
    private TextField extraDetailsTextField = new TextField();

    @FXML
    private TextField noPeopleTextField = new TextField();

    @FXML
    private Text packageNameText = new Text();

    @FXML
    private Text destinationText = new Text();

    @FXML
    private Text priceText = new Text();

    @FXML
    private Text startDateText = new Text();

    @FXML
    private Text endDateText = new Text();

    @FXML
    private Text extraDetailsText = new Text();

    @FXML
    private Text noPeopleText = new Text();

    @FXML
    private Button addNewButton = new Button();

    @FXML
    private Button editButton = new Button();

    @FXML
    private Button deleteButton = new Button();

    private void throwNewAlert(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.initStyle(StageStyle.UTILITY);
        alert.setTitle(message);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public void showFieldsAndButtonsForVacationPackages() {
        vacationPackagesTableView.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        destinationsTableView.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        packageNameText.setVisible(true);
        destinationText.setVisible(true);
        priceText.setVisible(true);
        startDateText.setVisible(true);
        endDateText.setVisible(true);
        extraDetailsText.setVisible(true);
        noPeopleText.setVisible(true);

        packageNameTextField.setVisible(true);
        packageNameTextField.clear();
        destinationChoiceBox.setVisible(true);
        destinationChoiceBox.getItems().clear();
        destinationChoiceBox.getItems().addAll(destinationService.getDestinationNames());
        priceTextField.setVisible(true);
        priceTextField.clear();
        startDatePicker.setVisible(true);
        endDatePicker.setVisible(true);
        extraDetailsTextField.setVisible(true);
        extraDetailsTextField.clear();
        noPeopleTextField.setVisible(true);
        noPeopleTextField.clear();

        addNewButton.setVisible(true);
        editButton.setVisible(true);
        deleteButton.setVisible(true);

        packageNameText.setText("Package name");
        priceText.setText("Price");
        addNewButton.setText("Add new package");
        editButton.setText("Edit package");
        deleteButton.setText("Delete package");
    }

    public void showFieldsAndButtonsForDestinations() {
        packageNameText.setVisible(true);
        destinationText.setVisible(false);
        priceText.setVisible(true);
        startDateText.setVisible(false);
        endDateText.setVisible(false);
        extraDetailsText.setVisible(false);
        noPeopleText.setVisible(false);

        packageNameTextField.setVisible(true);
        destinationChoiceBox.setVisible(false);
        priceTextField.setVisible(true);
        startDatePicker.setVisible(false);
        endDatePicker.setVisible(false);
        extraDetailsTextField.setVisible(false);
        noPeopleTextField.setVisible(false);

        addNewButton.setVisible(true);
        editButton.setVisible(false);
        deleteButton.setVisible(true);

        packageNameText.setText("Destination name");
        priceText.setText("Description");
        addNewButton.setText("Add new destination");
        deleteButton.setText("Delete destination");
    }

    public void updateVacationPackagesTableView() {
        try {
            List<VacationPackageDTO> vacationPackages = vacationPackageService.findAllVacationPackages();

            TableColumn<VacationPackageDTO, String> name = new TableColumn<>("Package ame");
            TableColumn<VacationPackageDTO, Double> price = new TableColumn<>("Price");
            TableColumn<VacationPackageDTO, LocalDate> startDate = new TableColumn<>("Start Date");
            TableColumn<VacationPackageDTO, LocalDate> endDate = new TableColumn<>("End Date");
            TableColumn<VacationPackageDTO, String> extraDetails = new TableColumn<>("Extra Details");
            TableColumn<VacationPackageDTO, String> noPeople = new TableColumn<>("No People");
            TableColumn<VacationPackageDTO, String> destinationName = new TableColumn<>("Destination");
            TableColumn<VacationPackageDTO, String> status = new TableColumn<>("Status");
            TableColumn<VacationPackageDTO, String> leftPackages = new TableColumn<>("Left Packages");

            name.setCellValueFactory(new PropertyValueFactory<>("name"));
            price.setCellValueFactory(new PropertyValueFactory<>("price"));
            startDate.setCellValueFactory(new PropertyValueFactory<>("startDate"));
            endDate.setCellValueFactory(new PropertyValueFactory<>("endDate"));
            extraDetails.setCellValueFactory(new PropertyValueFactory<>("extraDetails"));
            noPeople.setCellValueFactory(new PropertyValueFactory<>("noPeople"));
            destinationName.setCellValueFactory(new PropertyValueFactory<>("destinationName"));
            status.setCellValueFactory(new PropertyValueFactory<>("status"));
            leftPackages.setCellValueFactory(new PropertyValueFactory<>("leftPackages"));

            vacationPackagesTableView.getColumns().clear();
            vacationPackagesTableView.getColumns().addAll(name, price, destinationName, startDate, endDate, status, noPeople, extraDetails, leftPackages);
            vacationPackagesTableView.getItems().clear();
            vacationPackagesTableView.getItems().addAll(vacationPackages);
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    private void updateDestinationsView() {
        try {
            List<DestinationDTO> destinations = destinationService.findAllDestinations();

            TableColumn<DestinationDTO, String> name = new TableColumn<>("Name");
            TableColumn<DestinationDTO, String> description = new TableColumn<>("Description");

            name.setCellValueFactory(new PropertyValueFactory<>("name"));
            description.setCellValueFactory(new PropertyValueFactory<>("description"));

            destinationsTableView.getColumns().clear();
            destinationsTableView.getColumns().addAll(name, description);
            destinationsTableView.getItems().clear();
            destinationsTableView.getItems().addAll(destinations);
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void updateView() {
        try {
            if(tabPane.getSelectionModel().getSelectedItem() !=  null) {
                if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Vacation Packages")) {
                    showFieldsAndButtonsForVacationPackages();
                    updateVacationPackagesTableView();
                }
                else if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Destinations")) {
                    showFieldsAndButtonsForDestinations();
                    updateDestinationsView();
                }
            }
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void addNew() {
        try {
            if(tabPane.getSelectionModel().getSelectedItem() !=  null) {
                if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Vacation Packages")) {
                    VacationPackageDTO vacationPackageDTO = new VacationPackageDTO();

                    vacationPackageDTO.setName(packageNameTextField.getText());
                    vacationPackageDTO.setPrice(Double.parseDouble(priceTextField.getText()));
                    vacationPackageDTO.setNoPeople(Integer.parseInt(noPeopleTextField.getText()));
                    vacationPackageDTO.setStartDate(startDatePicker.getValue());
                    vacationPackageDTO.setEndDate(endDatePicker.getValue());
                    vacationPackageDTO.setExtraDetails(extraDetailsTextField.getText());
                    vacationPackageDTO.setDestinationName(destinationChoiceBox.getSelectionModel().getSelectedItem());

                    vacationPackageService.addVacationPackage(vacationPackageDTO);
                } else if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Destinations")) {
                    DestinationDTO destinationDTO = new DestinationDTO();

                    destinationDTO.setName(packageNameTextField.getText());
                    destinationDTO.setDescription(priceTextField.getText());

                    destinationService.addDestination(destinationDTO);
                }

                updateView();
            }
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void delete() {
        try{
            if(tabPane.getSelectionModel().getSelectedItem() !=  null) {
                if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Vacation Packages")) {
                    if(vacationPackagesTableView.getSelectionModel().getSelectedItem() != null) {
                        vacationPackageService.deleteVacationPackage(vacationPackagesTableView.getSelectionModel().getSelectedItem().getName());
                    }
                } else if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Destinations")) {
                    if(destinationsTableView.getSelectionModel().getSelectedItem() != null) {
                        destinationService.deleteDestination(destinationsTableView.getSelectionModel().getSelectedItem().getName());
                    }
                }

                updateView();
            }
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void editPackage() {
        try {
            VacationPackageDTO tablePackage = vacationPackagesTableView.getSelectionModel().getSelectedItem();

            VacationPackageDTO vacationPackageDTO = new VacationPackageDTO();

            vacationPackageDTO.setId(vacationPackagesTableView.getSelectionModel().getSelectedItem().getId());
            vacationPackageDTO.setName(packageNameTextField.getText());
            vacationPackageDTO.setPrice(Double.parseDouble(priceTextField.getText()));
            vacationPackageDTO.setNoPeople(Integer.parseInt(noPeopleTextField.getText()));
            vacationPackageDTO.setStartDate(startDatePicker.getValue());
            vacationPackageDTO.setEndDate(endDatePicker.getValue());
            vacationPackageDTO.setExtraDetails(extraDetailsTextField.getText());
            vacationPackageDTO.setDestinationName(destinationChoiceBox.getSelectionModel().getSelectedItem());
            vacationPackageDTO.setUsers(tablePackage.getUsers());
            vacationPackageDTO.setStatus(tablePackage.getStatus());

            vacationPackageService.editVacationPackage(vacationPackageDTO, tablePackage.getName());

            updateView();
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void fetchData() {
        if(tabPane.getSelectionModel().getSelectedItem() !=  null) {
            if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Vacation Packages")) {
                if (vacationPackagesTableView.getSelectionModel().getSelectedItem() != null) {
                    VacationPackageDTO vacationPackageDTO = vacationPackagesTableView.getSelectionModel().getSelectedItem();
                    packageNameTextField.setText(vacationPackageDTO.getName());
                    destinationChoiceBox.setValue(vacationPackageDTO.getDestinationName());
                    endDatePicker.setValue(vacationPackageDTO.getEndDate());
                    startDatePicker.setValue(vacationPackageDTO.getStartDate());
                    extraDetailsTextField.setText(vacationPackageDTO.getExtraDetails());
                    noPeopleTextField.setText(String.valueOf(vacationPackageDTO.getNoPeople()));
                    priceTextField.setText(String.valueOf(vacationPackageDTO.getPrice()));
                }
            }
        }
    }
}

