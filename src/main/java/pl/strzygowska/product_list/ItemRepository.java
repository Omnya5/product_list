package pl.strzygowska.product_list;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;

public interface ItemRepository extends JpaRepository<Item, Long> {
}
