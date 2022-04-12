package sd.assignment.backend_app.response;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Getter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

@JsonPropertyOrder({ "httpHeaders", "httpStatusCode", "message", "data" })
@Getter
public class ApiResponse<T> {
    private final HttpHeaders httpHeaders;
    private final int httpStatusCode;
    private final String message;
    private final T data;

    public ApiResponse(ApiResponseBuilder<T> builder) {
        this.httpHeaders = builder.getHttpHeaders();
        this.httpStatusCode = builder.getHttpStatusCode();
        this.message = builder.getMessage();
        this.data = builder.getData();
    }

    @Getter
    public static class ApiResponseBuilder<T> {
        private HttpHeaders httpHeaders = new HttpHeaders();
        private final int httpStatusCode;
        private final String message;
        private T data;

        public ApiResponseBuilder(int httpStatusCode, String message) {
            this.httpStatusCode = httpStatusCode;
            this.message = message;
        }

        public ApiResponseBuilder<T> withHttpHeader(HttpHeaders httpHeader) {
            this.httpHeaders = httpHeader;
            return this;
        }

        public ApiResponseBuilder<T> withData(T data) {
            this.data = data;
            return this;
        }

        public ResponseEntity<ApiResponse> build() {
            ApiResponse<T> apiResponse = new ApiResponse<>(this);
            return ResponseEntity.status(apiResponse.getHttpStatusCode()).headers(apiResponse.getHttpHeaders())
                    .body(apiResponse);
        }
    }
}
