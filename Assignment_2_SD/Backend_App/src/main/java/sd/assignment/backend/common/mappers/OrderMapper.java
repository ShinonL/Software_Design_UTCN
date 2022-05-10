package sd.assignment.backend.common.mappers;

import sd.assignment.backend.dtos.OrderDTO;
import sd.assignment.backend.dtos.OrderDetailsDTO;
import sd.assignment.backend.entities.Order;
import sd.assignment.backend.entities.OrderDetails;
import sd.assignment.backend.repositories.FoodRepository;
import sd.assignment.backend.repositories.UserRepository;

import java.util.List;
import java.util.stream.Collectors;

public class OrderMapper {
    public static Order convertToEntity(OrderDTO orderDTO, UserRepository userRepository, FoodRepository foodRepository) {
        Order order = new Order();

        order.setId(orderDTO.getId());
        order.setLocation(orderDTO.getLocation());
        order.setOrderState(orderDTO.getOrderState());
        order.setTotalAmount(orderDTO.getTotal());
        order.setUser(userRepository.findByUsername(orderDTO.getUsername()));
        order.setZone(ZoneMapper.convertToEntity(orderDTO.getZoneDTO()));

        if (orderDTO.getOrderDetailsDTO() == null)
            return order;

        List<OrderDetails> orderDetails = orderDTO.getOrderDetailsDTO()
                .stream()
                .map(od -> convertToEntity(od, foodRepository))
                .collect(Collectors.toList());
        order.setOrderDetails(orderDetails);

        return order;
    }

    public static OrderDetails convertToEntity(OrderDetailsDTO orderDetailsDTO, FoodRepository foodRepository) {
        OrderDetails orderDetails = new OrderDetails();

        orderDetails.setId(orderDetailsDTO.getId());
        orderDetails.setQuantity(orderDetailsDTO.getQuantity());
        orderDetails.setFood(foodRepository.getById(orderDetailsDTO.getFoodDTO().getId()));

        return orderDetails;
    }

    public static OrderDTO convertToDTO(Order order) {
        OrderDTO orderDTO = new OrderDTO();

        orderDTO.setId(order.getId());
        orderDTO.setLocation(order.getLocation());
        orderDTO.setOrderState(order.getOrderState());
        orderDTO.setTotal(order.getTotalAmount());
        orderDTO.setUsername(order.getUser().getUsername());
        orderDTO.setZoneDTO(ZoneMapper.convertToDTO(order.getZone()));

        if (order.getOrderDetails() == null)
            return orderDTO;

        List<OrderDetailsDTO> orderDetailsDTO = order.getOrderDetails()
                .stream()
                .map(OrderMapper::convertToDTO)
                .collect(Collectors.toList());
        orderDTO.setOrderDetailsDTO(orderDetailsDTO);

        return orderDTO;
    }

    public static OrderDetailsDTO convertToDTO(OrderDetails orderDetails) {
        OrderDetailsDTO orderDetailsDTO = new OrderDetailsDTO();

        orderDetailsDTO.setId(orderDetails.getId());
        orderDetailsDTO.setQuantity(orderDetails.getQuantity());
        orderDetailsDTO.setFoodDTO(FoodMapper.convertToDTO(orderDetails.getFood()));

        return orderDetailsDTO;
    }
}
