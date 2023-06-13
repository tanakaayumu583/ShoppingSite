    // 商品データ（仮のデータ）
    var products = [
    {
        name: 'Product 1',
        price: 9.99,
        image: 'product1.jpg'
      },
      {
        name: 'Product 2',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 3',
        price: 9.99,
        image: 'product1.jpg'
      },
      {
        name: 'Product 4',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 5',
        price: 9.99,
        image: 'product1.jpg'
      },
      {
        name: 'Product 6',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 7',
        price: 9.99,
        image: 'product1.jpg'
      },
      {
        name: 'Product 8',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 9',
        price: 9.99,
        image: 'product1.jpg'
      },
      {
        name: 'Product 10',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 11',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 12',
        price: 9.99,
        image: 'product1.jpg'
      },
      {
        name: 'Product 13',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 14',
        price: 19.99,
        image: 'product2.jpg'
      },
      {
        name: 'Product 15',
        price: 9.99,
        image: 'product1.jpg'
      },
      {
        name: 'Product 16',
        price: 19.99,
        image: 'product2.jpg'
      },
      // 他の商品データを追加
    ];

    // ページの読み込みが完了したときに実行されるコード
    window.onload = function() {
      // 商品を表示するための要素を取得
      var productContainer = document.getElementById('productContainer');

      // 商品データをループして商品要素を作成し、表示する
      products.forEach(function(product) {
        var productElement = document.createElement('div');
        productElement.className = 'product';

        var imageElement = document.createElement('img');
        imageElement.src = product.image;
        imageElement.alt = product.name;
        productElement.appendChild(imageElement);

        var nameElement = document.createElement('h3');
        nameElement.innerHTML = product.name;
        productElement.appendChild(nameElement);

        var priceElement = document.createElement('p');
        priceElement.innerHTML = '$' + product.price;
        productElement.appendChild(priceElement);

        productContainer.appendChild(productElement);
      });

      var productElements = productContainer.getElementsByClassName('product');
      var containerWidth = productContainer.offsetWidth;
      var productWidth = productElements[0].offsetWidth;
      var scrollAmount = productWidth * 2; // スクロールする量

      // 表示領域内の商品を切り替える関数
      function switchVisibleProducts() {
        var scrollLeft = productContainer.scrollLeft;

        for (var i = 0; i < productElements.length; i++) {
          var productElement = productElements[i];
          var productOffsetLeft = productElement.offsetLeft;

          if (scrollLeft >= productOffsetLeft) {
            var nextIndex = (i + 1) % productElements.length;
            var prevIndex = (i - 1 + productElements.length) % productElements.length;
            var nextProduct = productElements[nextIndex];
            var prevProduct = productElements[prevIndex];

            if (scrollLeft - productOffsetLeft >= productWidth / 2) {
              productContainer.appendChild(productElement);
              productContainer.scrollLeft += nextProduct.offsetLeft - productOffsetLeft;
            } else {
              productContainer.insertBefore(productElement, prevProduct);
              productContainer.scrollLeft -= productOffsetLeft - prevProduct.offsetLeft;
            }

            break;
          }
        }

        // ハイライトを設定
        var visibleWidth = productContainer.offsetWidth;
        var visibleLeft = productContainer.scrollLeft;
        var visibleRight = visibleLeft + visibleWidth;

        for (var j = 0; j < productElements.length; j++) {
          var product = productElements[j];
          var productLeft = product.offsetLeft;
          var productRight = productLeft + product.offsetWidth;

          if (productLeft >= visibleLeft+460 && productRight <= visibleRight-480) {
            product.classList.add('highlight');
          } else {
            product.classList.remove('highlight');
          }
        }
      }

      // マウスホイールイベントのハンドリング
      productContainer.addEventListener('wheel', function(event) {
        event.preventDefault(); // デフォルトのスクロール動作を無効化
        var scrollDirection = event.deltaY > 0 ? 1 : -1; // マウスホイールのスクロール方向

        // 横スクロール
        productContainer.scrollLeft += scrollAmount * scrollDirection;

        // 商品の表示切り替え
        switchVisibleProducts();
      });

      // 初期表示時に中央の商品をハイライトする
      switchVisibleProducts();
    };