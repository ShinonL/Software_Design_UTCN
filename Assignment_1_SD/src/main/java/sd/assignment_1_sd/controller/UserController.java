package sd.assignment_1_sd.controller;

import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.stage.Window;
import sd.assignment_1_sd.dto.VacationPackageDTO;
import sd.assignment_1_sd.service.DestinationService;
import sd.assignment_1_sd.service.UserService;
import sd.assignment_1_sd.service.VacationPackageService;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

public class UserController {
    private final VacationPackageService vacationPackageService = new VacationPackageService();
    private final DestinationService destinationService = new DestinationService();
    private final UserService userService = new UserService();

    @FXML
    private TabPane tabPane;

    @FXML
    private TableView<VacationPackageDTO> availablePackagesTableView;

    @FXML
    private TableView<VacationPackageDTO> myBookingsTableView;

    @FXML
    private ChoiceBox<String> filterType = new ChoiceBox<>();

    @FXML
    private Text firstText = new Text();

    @FXML
    private Text secondText = new Text();

    @FXML
    private ChoiceBox<Object> firstChoiceBox = new ChoiceBox<>();

    @FXML
    private ChoiceBox<Object> secondChoiceBox = new ChoiceBox<>();

    @FXML
    private DatePicker startDatePicker = new DatePicker();

    @FXML
    private DatePicker endDatePicker = new DatePicker();

    @FXML
    private Button bookPackageButton = new Button();

    @FXML
    private Button filterButton = new Button();

    private void throwNewAlert(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.initStyle(StageStyle.UTILITY);
        alert.setTitle(message);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private String getUsername() {
        List<Window> windows = Stage.getWindows().stream()
                .filter(Window::isFocused)
                .collect(Collectors.toList());

        Stage thisStage = (Stage) windows.get(0);
        return thisStage.getTitle();
    }

    public void showTextsAndButtonsForAvailablePackages() {
        firstText.setVisible(false);
        secondText.setVisible(false);

        startDatePicker.setVisible(false);
        endDatePicker.setVisible(false);

        firstChoiceBox.setVisible(false);
        secondChoiceBox.setVisible(false);

        filterType.getItems().clear();
        filterType.getItems().addAll("destination", "price", "period");

        filterButton.setVisible(false);
    }

    public void showTextsAndButtonsForMyBookings() {
        firstText.setVisible(false);
        secondText.setVisible(false);

        startDatePicker.setVisible(false);
        endDatePicker.setVisible(false);

        firstChoiceBox.setVisible(false);
        secondChoiceBox.setVisible(false);

        filterType.getItems().clear();
        filterType.getItems().addAll("destination", "price", "period");

        filterButton.setVisible(false);
    }

    public void updateTableView(List<VacationPackageDTO> vacationPackages, TableView<VacationPackageDTO> tableViewToBeUpdated) {
        try {
            TableColumn<VacationPackageDTO, String> name = new TableColumn<>("Package Name");
            TableColumn<VacationPackageDTO, Double> price = new TableColumn<>("Price");
            TableColumn<VacationPackageDTO, LocalDate> startDate = new TableColumn<>("Start Date");
            TableColumn<VacationPackageDTO, LocalDate> endDate = new TableColumn<>("End Date");
            TableColumn<VacationPackageDTO, String> extraDetails = new TableColumn<>("Extra Details");
            TableColumn<VacationPackageDTO, String> destinationName = new TableColumn<>("Destination");
            TableColumn<VacationPackageDTO, String> leftPackages = new TableColumn<>("Left Packages");

            name.setCellValueFactory(new PropertyValueFactory<>("name"));
            name.setPrefWidth(300);
            price.setCellValueFactory(new PropertyValueFactory<>("price"));
            price.setPrefWidth(70);
            startDate.setCellValueFactory(new PropertyValueFactory<>("startDate"));
            startDate.setPrefWidth(100);
            endDate.setCellValueFactory(new PropertyValueFactory<>("endDate"));
            endDate.setPrefWidth(100);
            extraDetails.setCellValueFactory(new PropertyValueFactory<>("extraDetails"));
            extraDetails.setPrefWidth(357);
            destinationName.setCellValueFactory(new PropertyValueFactory<>("destinationName"));
            destinationName.setPrefWidth(100);
            leftPackages.setCellValueFactory(new PropertyValueFactory<>("leftPackages"));
            leftPackages.setPrefWidth(170);

            tableViewToBeUpdated.getColumns().clear();
            tableViewToBeUpdated.getColumns().addAll(name, price, destinationName, startDate, endDate, leftPackages, extraDetails);
            tableViewToBeUpdated.getItems().clear();
            tableViewToBeUpdated.getItems().addAll(vacationPackages);

        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void updateView() {
        try {
            if(tabPane.getSelectionModel().getSelectedItem() != null) {
                if(tabPane.getSelectionModel().getSelectedItem().getText().equals("Available Packages")) {
                    List<VacationPackageDTO> vacationPackages = vacationPackageService.findAvailable();
                    updateTableView(vacationPackages, availablePackagesTableView);
                    showTextsAndButtonsForAvailablePackages();
                } else if(tabPane.getSelectionModel().getSelectedItem().getText().equals("My bookings")) {
                    List<VacationPackageDTO> vacationPackages = vacationPackageService.findMyBookings(getUsername());
                    updateTableView(vacationPackages, myBookingsTableView);
                    showTextsAndButtonsForMyBookings();
                }
            }
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void filter() {
        try {
            if (filterType.getSelectionModel().getSelectedItem() != null) {
                if(filterType.getSelectionModel().getSelectedItem().equals("destination")) {
                    String destination = firstChoiceBox.getSelectionModel().getSelectedItem().toString();

                    List<VacationPackageDTO> vacationPackages;
                    if (tabPane.getSelectionModel().getSelectedItem().getText().equals("Available Packages")) {
                        vacationPackages = vacationPackageService.filterByDestination(destination, true);
                        updateTableView(vacationPackages, availablePackagesTableView);
                    } else if (tabPane.getSelectionModel().getSelectedItem().getText().equals("My bookings")) {
                        vacationPackages = vacationPackageService.filterByDestination(destination, false);
                        updateTableView(vacationPackages, myBookingsTableView);
                    }
                } else if (filterType.getSelectionModel().getSelectedItem().equals("price")) {
                    Double minPrice = (Double) firstChoiceBox.getSelectionModel().getSelectedItem();
                    Double maxPrice = (Double) secondChoiceBox.getSelectionModel().getSelectedItem();

                    List<VacationPackageDTO> vacationPackages;
                    if (tabPane.getSelectionModel().getSelectedItem().getText().equals("Available Packages")) {
                        vacationPackages = vacationPackageService.filterByPrice(minPrice, maxPrice, true);
                        updateTableView(vacationPackages, availablePackagesTableView);
                    } else if (tabPane.getSelectionModel().getSelectedItem().getText().equals("My bookings")) {
                        vacationPackages = vacationPackageService.filterByPrice(minPrice, maxPrice, false);
                        updateTableView(vacationPackages, myBookingsTableView);
                    }
                } else if (filterType.getSelectionModel().getSelectedItem().equals("period")) {
                    LocalDate startDate = startDatePicker.getValue();
                    LocalDate endDate = endDatePicker.getValue();

                    List<VacationPackageDTO> vacationPackages;
                    if (tabPane.getSelectionModel().getSelectedItem().getText().equals("Available Packages")) {
                        vacationPackages = vacationPackageService.filterByPeriod(startDate, endDate, true);
                        updateTableView(vacationPackages, availablePackagesTableView);
                    } else if (tabPane.getSelectionModel().getSelectedItem().getText().equals("My bookings")) {
                        vacationPackages = vacationPackageService.filterByPeriod(startDate, endDate, false);
                        updateTableView(vacationPackages, myBookingsTableView);
                    }
                }
            }
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void showFilterOptions() {
        if (filterType.getSelectionModel().getSelectedItem() != null) {
            if(filterType.getSelectionModel().getSelectedItem().equals("destination")) {
                firstText.setVisible(true);
                secondText.setVisible(false);
                firstChoiceBox.setVisible(true);
                secondChoiceBox.setVisible(false);
                startDatePicker.setVisible(false);
                endDatePicker.setVisible(false);
                filterButton.setVisible(false);

                firstText.setText("Select a destination");
                firstChoiceBox.getItems().clear();
                firstChoiceBox.getItems().addAll(destinationService.getDestinationNames());
            } else if(filterType.getSelectionModel().getSelectedItem().equals("price")) {
                firstText.setText("Min value");
                firstText.setVisible(true);
                secondText.setVisible(true);
                firstChoiceBox.setVisible(true);
                secondChoiceBox.setVisible(true);
                startDatePicker.setVisible(false);
                endDatePicker.setVisible(false);
                filterButton.setVisible(false);

                firstChoiceBox.getItems().clear();
                firstChoiceBox.getItems().addAll(vacationPackageService.getPrices(0.0));
                secondChoiceBox.getItems().clear();
                secondChoiceBox.getItems().addAll(vacationPackageService.getPrices(100.0));
            } else if(filterType.getSelectionModel().getSelectedItem().equals("period")) {
                firstText.setText("Select a start date");
                secondText.setText("Select an end date");
                firstText.setVisible(true);
                secondText.setVisible(false);
                firstChoiceBox.setVisible(false);
                secondChoiceBox.setVisible(false);
                startDatePicker.setVisible(true);
                filterButton.setVisible(false);
            }
        }
    }

    public void selectStartDateHandling() {
        if(startDatePicker.getValue() != null) {
            endDatePicker.setVisible(true);
            secondText.setVisible(true);
        }
    }

    public void selectEndDateHandling() {
        if(endDatePicker.getValue() != null)
            filterButton.setVisible(true);
    }

    public void selectChoiceBoxHandling() {
        if(filterType.getSelectionModel().getSelectedItem().equals("destination")) {
            if(firstChoiceBox.getSelectionModel().getSelectedItem() != null)
                filterButton.setVisible(true);
        } else if(filterType.getSelectionModel().getSelectedItem().equals("price")) {
            if(firstChoiceBox.getSelectionModel().getSelectedItem() != null && secondChoiceBox.getSelectionModel().getSelectedItem() != null)
                filterButton.setVisible(true);
        }
    }

    public void bookPackage() {
        try {
            userService.bookVacationPackage(availablePackagesTableView.getSelectionModel().getSelectedItem(), getUsername());
            updateView();
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }

    public void selectedRow() {
        if(availablePackagesTableView.getSelectionModel().getSelectedItem() != null)
            bookPackageButton.setVisible(true);
    }
}

