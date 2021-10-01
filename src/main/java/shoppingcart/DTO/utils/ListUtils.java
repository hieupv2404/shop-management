package shoppingcart.DTO.utils;

import org.springframework.data.domain.Page;

import java.util.Collections;
import java.util.List;

public class ListUtils {
    public static <T> List<T> getPage(List<T> sourceList, int page, int pageSize) {

        if (pageSize <= 0 || page < 0) {
            throw new IllegalArgumentException("invalid page size: " + pageSize);
        }

        int fromIndex = (page) * pageSize;
        if (sourceList == null || sourceList.size() < fromIndex) {
            return Collections.emptyList();
        }

        // toIndex exclusive
        return sourceList.subList(fromIndex, Math.min(fromIndex + pageSize, sourceList.size()));
    }

    public static <T> Integer getTotalPages(List<T> sourceList, int pageSize) {
        if (sourceList.size() % pageSize == 0) {
            return sourceList.size() / pageSize;
        }
        return sourceList.size() / pageSize + 1;
    }
}
