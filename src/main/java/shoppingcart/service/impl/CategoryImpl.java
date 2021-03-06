package shoppingcart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shoppingcart.entity.Category;
import shoppingcart.entity.User;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.service.CategoryService;

import java.util.List;
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

    public boolean prepareArray(Category cate, List<Category> arrayOld) {
        boolean check = true; // mac dinh check == true la chua co trong db
        for (Category category : arrayOld) {
            if (cate.getId() == category.getId()) { // neu ma co trong db roi thi tra ve false
                check = false;
                break;
            }
        }
        return check;
    }

}
