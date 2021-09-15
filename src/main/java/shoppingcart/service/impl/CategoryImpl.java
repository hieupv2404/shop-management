package shoppingcart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shoppingcart.entity.Category;
import shoppingcart.entity.User;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.service.CategoryService;

import java.util.Optional;

@Service
public class CategoryImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public Iterable<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Optional<Category> findById(Integer id) {
        return categoryRepository.findById(id);
    }

    @Override
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public void remove(Integer id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public Category updateCategory(Integer id, Category category) {
        if (category != null) {
            Category category1 = categoryRepository.getById(id);
            if (category1 != null) {
                category1.setName(category.getName());
                return categoryRepository.save(category1);
            }
        }
        return null;
    }
}
