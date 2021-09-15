package shoppingcart.service;

import shoppingcart.entity.Category;

public interface CategoryService extends IGeneralService<Category> {
    public Category updateCategory(Integer id, Category category);

}
