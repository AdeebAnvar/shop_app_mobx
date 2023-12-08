String readSingleProducts =
    """query products(\$pageSize: Int!, \$page: Int!, \$filter: ProductAttributeFilterInput!, \$searchQuery: String) {
  products(search: \$searchQuery, filter: \$filter, pageSize: \$pageSize, currentPage: \$page) {
    aggregations(
      filter: {
        category: {
          includeDirectChildrenOnly: true
        }
      }
    ) {
      attribute_code
      count
      label
      options {
        label
        value
        count
      }
    }
    items {
        # additional_info{
        #   label
        #   value
        # }
        name
        sku
        url_key
        url_suffix
        image{
          url
        }
        rating_summary
        review_count
        stock_status
        
        categories{
          name
          uid
          path
        }
        ... on PhysicalProductInterface{
          weight
        }
        # wishlistData{
        #   wishlistItem
        # }
        description {
          html
        }
        short_description	{
          html
        }
        __typename
        special_price
        price_range{
          minimum_price{
            regular_price{
              value
              currency
            }
          }
          maximum_price {
            regular_price {
              value
              currency
            }
            discount {
                amount_off
                percent_off
            }
          }
        }
        # productLabel{
        #   items {
        #     customers_group_ids
        #     end_date
        #     image
        #     image_data
        #     label_text
        #     label_text_data
        #     labelname
        #     priority
        #     productlabel_id
        #     start_date
        #     status
        #     store_ids
        #   }
        #   totalCount
        # }
        # ruleLabel {
        #   items {
        #     display_category
        #     display_product
        #     label_image
        #     rule_id
        #   }
        # }
        # product_inventory{
        #   enable_qty_increments
        #   is_qty_decimal
        #   max_sale_qty
        #   min_sale_qty
        #   qty_increments
        # }
        categories {
          id
        }
        ... on ConfigurableProduct {
          configurable_options {
            id
            attribute_id_v2
            label
            position
            use_default
            attribute_code
            values {
              uid
              value_index
              label
              swatch_data{
                value 
              }
            }
            product_id
          }
          variants {
            product {
              id
              name
              sku
              attribute_set_id
              media_gallery {
                url
                label
              }
              ... on PhysicalProductInterface {
                weight
              }

              price_range{
                minimum_price{
                  regular_price{
                    value
                    currency
                  }
                }
                 maximum_price {
                   regular_price {
                      value
                      currency
                    }
                  discount {
                      amount_off
                      percent_off
                  }
                }
              }
            }
            attributes {
              uid
              label
              code
              value_index
            }
          }
        }
        media_gallery {
            url
            label
            ... on ProductVideo {
                video_content {
                    media_type
                    video_provider
                    video_url
                    video_title
                    video_description
                    video_metadata
                }
            }
        }
        related_products{
          name
          sku      
          url_key
          url_suffix
          image{
            url
          }
          rating_summary
          review_count
          stock_status
          
          categories{
            name
            uid
            path
          }
          price_range{
            minimum_price{
              regular_price{
                value
                currency
              }
            }
            maximum_price {
              regular_price {
                value
                currency
              }
              discount {
                  amount_off
                  percent_off
              }
            }
          }
          # product_inventory{
          #   enable_qty_increments
          #   is_qty_decimal
          #   max_sale_qty
          #   min_sale_qty
          #   qty_increments
          # }
        }
      }
      sort_fields {
        default
        options{
          label
          value
        }
      }
      page_info {
        current_page
        page_size
        total_pages
      }
    }
  }
  
  """;

String addToCartQuery =
    """mutation addProductsToCart(\$cartIdString: String!,\$cartItemsMap:[CartItemInput!]!){
    addProductsToCart(
     cartId: \$cartIdString
     cartItems: \$cartItemsMap
  ) {
    cart {
      items {
        id
        product {
          name
          sku
          url_key
          url_suffix
          image{
            url
          }
          stock_status
          special_price
          price_range{
            minimum_price{
              regular_price{
                value
                currency
              }
            }
            maximum_price {
              regular_price {
                value
                currency
              }
              discount {
                  amount_off
                  percent_off
              }
            }
          }
        }
        quantity
      }
      
      total_quantity
    }
    user_errors {
      code
      message
    }
  }
  }""";
String createEmptyCartQueryString = 'mutation {createEmptyCart}';
String createCustomerCartQueryString = '{customerCart {id}}';

String allCartsQueryString = """
query(\$cart_id:String!){
  cart(cart_id: \$cart_id) {
    applied_coupon {
      code
    }
    applied_coupons {
      code
    }
    available_payment_methods {
      code
      is_deferred
      title
    }
    billing_address {
      city
      company
      country{
        code ,
        label,
      }
      customer_notes
      firstname
      lastname
      postcode
      region{
        code,
        label,
        region_id
      }
      street
      telephone
      uid
      vat_id
    }
    email
    gift_message {
      from
      message
      to
    }
    id
    is_virtual
    items {
      errors{
        code,
        message,
      }
      id
      prices{
       
        discounts{
          amount{
          currency,
            value
},
          label,
        }
         price{
        currency,value
      }
        price_including_tax{
          currency,value
        }
         row_total{
          currency,value
        }
         row_total_including_tax{
          currency,value
        }
        total_item_discount{
          currency,value
        }
      }
     
      product{
        image{
          url,
          label
        }
      }
      quantity
      uid
    }
     prices{
       grand_total{
          value,currency
        }
      subtotal_with_discount_excluding_tax{
        value,currency
      }
        discounts{
          amount{
          currency,
            value
},
          label,
        }
        
       
       
      }
    selected_payment_method {
      code
      purchase_order_number
      title
    }
    
    total_quantity
  }
}
""";
