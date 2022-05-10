package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.exceptions.NotFoundException;
import sd.assignment.backend.common.mappers.FoodMapper;
import sd.assignment.backend.dtos.FoodDTO;
import sd.assignment.backend.entities.Restaurant;
import sd.assignment.backend.repositories.FoodRepository;
import sd.assignment.backend.repositories.RestaurantRepository;
import sd.assignment.backend.validators.FoodValidator;
import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfWriter;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `food` entity
 */
@Slf4j
@Service
public class FoodService {
    /**
     * The food repository deals with running sql commands specific to the `food` table
     */
    @Autowired
    private FoodRepository foodRepository;

    /**
     * The restaurant repository deals with running sql commands specific to the `restaurant` table
     */
    @Autowired
    private RestaurantRepository restaurantRepository;

    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(FoodService.class);

    /**
     * Validate and create a food item for a specific restaurant
     * @param foodDTO Contains details about the food and its restaurant
     * @throws Exception if the details are invalid or the save couln't be done
     */
    public void createFood(FoodDTO foodDTO) throws Exception {
        logger.info("Validating food details for " + foodDTO.getName());
        FoodValidator.isFoodValid(foodDTO);

        logger.info("Validating restaurant " + foodDTO.getRestaurantName());
        Restaurant restaurant = restaurantRepository.findByName(foodDTO.getRestaurantName());
        if (restaurant == null) {
            logger.error("Restaurant " + foodDTO.getRestaurantName() + " was not found.");
            throw new NotFoundException("Restaurant " + foodDTO.getRestaurantName() + " was not found.");
        }

        logger.info("Saving the food");
        foodDTO.setRestaurantName(restaurant.getName());
        foodRepository.save(FoodMapper.convertToEntity(foodDTO, restaurantRepository));
    }

    /**
     * Retrieved the foods for a specific restaurant
     * @param restaurantId The DB id of a specific restaurant
     * @return The foods that are associated with the given restaurant id
     * @throws Exception if the restaurant does not exist or if the foods couldn't be accessed
     */
    public List<FoodDTO> getFoodsByRestaurant(String restaurantId) throws Exception {
        logger.info("Validating restaurant " + restaurantId);
        Optional<Restaurant> restaurant = restaurantRepository.findById(restaurantId);
        if (restaurant.isEmpty()) {
            logger.error("Restaurant " + restaurantId + " was not found.");
            throw new NotFoundException("Restaurant was not found.");
        }

        logger.info("Retrieving foods for " + restaurantId);
        return foodRepository.findByRestaurant(restaurant.get())
                .stream()
                .map(FoodMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Creates a document containing the foods of a given restaurant
     * @param restaurantId The DB id of a specific restaurant
     * @param response the http response to which the document will be attached
     * @throws Exception if there is anything wrong with the file operations
     */
    public void createPdfOfRestaurantMenu(String restaurantId, HttpServletResponse response) throws Exception {
        List<FoodDTO> foods = getFoodsByRestaurant(restaurantId);

        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        Font fontTitle = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        fontTitle.setSize(20);

        Paragraph title = new Paragraph("Menu for restaurant with id " + restaurantId, fontTitle);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(title);

        Font fontFoodName = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        fontFoodName.setSize(18);

        Font fontFoodDetails = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        fontFoodDetails.setSize(14);

        for(FoodDTO food: foods){
            Paragraph foodTitle = new Paragraph(food.getName() + "\n", fontFoodName);
            foodTitle.setAlignment(Paragraph.ALIGN_LEFT);
            document.add(foodTitle);

            Paragraph foodDescription = new Paragraph("Category: " + food.getCategory() + "\n", fontFoodDetails);
            foodDescription.setAlignment(Paragraph.ALIGN_LEFT);
            document.add(foodDescription);

            foodDescription = new Paragraph("Description: " + food.getDescription() + "\n", fontFoodDetails);
            foodDescription.setAlignment(Paragraph.ALIGN_LEFT);
            document.add(foodDescription);

            foodDescription = new Paragraph("Price: " + food.getPrice() + "\n", fontFoodDetails);
            foodDescription.setAlignment(Paragraph.ALIGN_LEFT);
            document.add(foodDescription);
        }
        document.close();
    }
}
