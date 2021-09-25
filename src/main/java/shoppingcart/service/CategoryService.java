package shoppingcart.service;

import shoppingcart.entity.Category;

import java.util.List;

public interface CategoryService extends IGeneralService<Category> {
    public boolean prepareArray(Category cate, List<Category> arrayOld);
}
