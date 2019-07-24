USE bikesdb ;

-- Each product also belongs a category specified by the category_id column. Also, each category may have zero or many products.

-- https://tableplus.io/blog/2018/08/mysql-how-to-drop-constraint-in-mysql.html


ALTER TABLE `products`
ADD CONSTRAINT `fk_products_category`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`category_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;


-- Each product belongs to a brand specified by the brand_id column. Hence, a brand may have zero or many products.

ALTER TABLE `products`
ADD CONSTRAINT `fk_products_brand`
  FOREIGN KEY (`brand_id`)
  REFERENCES `brands` (`brand_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;

ALTER TABLE `stocks`
ADD CONSTRAINT `fk_stocks_product`
  FOREIGN KEY (`product_id`)
  REFERENCES `products` (`product_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;
  
ALTER TABLE `stocks`
ADD CONSTRAINT `fk_stocks_store`
  FOREIGN KEY (`store_id`)
  REFERENCES `stores` (`store_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;
  
ALTER TABLE `orders`
ADD CONSTRAINT `fk_order_customer`
  FOREIGN KEY (`customer_id`)
  REFERENCES `customers` (`customer_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;
  
ALTER TABLE `orders`
ADD CONSTRAINT `fk_order_staff`
  FOREIGN KEY (`staff_id`)
  REFERENCES `staffs` (`staff_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;
  
ALTER TABLE `orders`
ADD CONSTRAINT `fk_order_store`
  FOREIGN KEY (`store_id`)
  REFERENCES `stores` (`store_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;
  
ALTER TABLE `staffs`
ADD CONSTRAINT `fk_staff_store`
  FOREIGN KEY (`store_id`)
  REFERENCES `stores` (`store_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;

ALTER TABLE `order_items`
ADD CONSTRAINT `fk_orderitem_products`
  FOREIGN KEY (`product_id`)
  REFERENCES `products` (`product_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;
  
ALTER TABLE `order_items`
ADD CONSTRAINT `fk_orderitem_orders`
  FOREIGN KEY (`order_id`)
  REFERENCES `orders` (`order_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;

ALTER TABLE staffs
ADD CONSTRAINT fk_staff_manager
	FOREIGN KEY (manager_id)
    REFERENCES staffs (staff_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
