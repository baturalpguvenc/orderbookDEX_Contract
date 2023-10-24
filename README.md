## orderbookDEX_Contract
DATS Project Task-1
(Merkeziyetsiz Finans)

# Figma (Şahsi) OrderbookDEX İnceleme

link: [https://www.figma.com/file/wMc8ZYHkXqfIOjXcnooqq9/orderbookDEX?type=whiteboard&node-id=0%3A1&t=FMZ7Mybs8xmPK6Hb-1]



# "Red-Black-Tree Orderbook ALgoritması" 

* Bir değişim (exchange) veya ticaret platformında siparişlerin düzgün bir şekilde saklanması ve sıralanması gerekir. Ağaç veri yapısı, siparişlerin fiyat sırasına göre hızlı bir şekilde erişilmesine olanak tanır. Kısacası siparişleri yönetmede sıra yapısını kullanmamıza olan sağlar.

* Red-Black tree'ler, eklemeler, silmeler ve aramalar için hızlıdır ve genellikle O(log n) zaman karmaşıklığına sahiptir. Bu, büyük sipariş defterlerini yönetmek için gereken işlem sayısını azaltır.

* using BokkyPooBahsRedBlackTreeLibrary for BokkyPooBahsRedBlackTreeLibrary.Tree; ifadesi ile ağaç kütüphanesi kullanılır ve Tree adlı bir veri yapısına bu kütüphanenin işlevselliği eklenir.
Kısacası, bu kütüphane, "Chadex" akıllı sözleşmesi içinde kullanılmak üzere tasarlanmıştır ve ağaç veri yapısı işlevselliğini eklemek için "BokkyPooBah's Red-Black Tree Library" kütüphanesini içeri aktarır. Bu, kodun daha temiz ve modüler olmasını sağlar ve ağaç veri yapısı ile ilgili tekrarlayan kod parçalarını önler.

* O(log n)
O(log n) zaman karmaşıklığının verimli olmasının nedenleri şunlar olabilir:

İşlem Sayısının Logaritmik Büyümesi: O(log n), n büyüdükçe işlem sayısının çok daha yavaş bir hızda arttığını gösterir. Her bir adımda veri kümesini yaklaşık olarak yarıya bölerseniz, büyük veri kümesinde bile hızlı sonuçlar elde edersiniz.

Veri Miktarı Arttıkça Verimlilik: O(log n) karmaşıklığı, veri miktarı arttıkça işlem sürelerinin hızlı bir şekilde artmadığı anlamına gelir. Bu, büyük veri setleri üzerinde çalışırken hızlı ve etkili işlem yapmanızı sağlar.

Daha Az Karşılaştırma ve İşlem: O(log n) işlemleri, verinin yarıya indirildiği her adımda sadece birkaç karşılaştırma veya işlem gerektirir. Bu, işlem maliyetini düşürür.

Dengeli Veri Yapıları İle Uyumluluk: O(log n) zaman karmaşıklığı, denge ağaçları gibi dengeli veri yapıları ile uyumlu olup, bu tür ağaçların hızlı arama, ekleme ve silme işlemleri sunmasına yardımcı olur.
* Kütüphaneler, kodun daha modüler olmasını sağlar. Özellikle farklı projelerde aynı ağaç veri yapısını kullanmak istediğinizde, bu kütüphane yeniden kullanılabilir bir çözüm sunar.

Bu nedenlerle, Chadex kontratı gibi bir token borsası veya değişim kontratı içinde sipariş defteri yönetimi için ağaç veri yapısı kullanmak ve bu tür bir işlevselliği sağlamak amacıyla "BokkyPooBah's Red-Black Tree Library" veya benzer bir kütüphaneyi içeri aktarmak mantıklıdır. Bu, kodun daha etkili ve güvenilir olmasına yardımcı olur ve import edilir.

# "Chadex.sol" İnceleme

* Price: uint128 türünde bir özel veri türüdür ve işaretsiz tamsayı verilerini temsil eder. (101 :D)

* BokkyPooBahsRedBlackTreeLibrary: Kırmızı-siyah ağaç işlemlerini gerçekleştiren bir kütüphane olarak kullanılır, yukarıda açıklamasını başlık olarak yaptım.

* Chadex Base Contract: Bu bir Solidity akıllı sözleşmesidir ve "Chadex" adlı bir DEX (Merkezi Olmayan Borsa) platformunu temsil eder. Chadex, çeşitli varlıklar arasında takas yapmak için kullanılabilir.

* [Interface IERC20]: Bu, bir "Ethereum ERC-20" token standardını temsil eden bir arayüzdür. Bu, sözleşmenin ERC-20 uyumlu tokenlarla etkileşime girmesine olanak tanır.

* (Security) ReentrancyGuard Contract: Bu sözleşme, sözleşmenin yeniden girişi (reentrancy) önlemesine yardımcı olur. Bu, güvenlik sorunlarını önlemek için kullanılır.

* ChadexBase Contract: Chadex'in ana sözleşmesidir. Bu sözleşme, borsanın temel işlevselliğini içerir ve aşağıdaki ana bölümlere ayrılır:

a. Fonksiyonlar ve Veri Yapıları: Chadex'in işlevlerini ve veri yapılarını tanımlar. Örneğin, işlem çiftleri (Pairs), sipariş sıraları (OrderQueue), siparişler (Orders) ve daha fazlası burada tanımlanır.

b. Özel Fonksiyonlar: Sözleşmenin özel işlevleri, siparişleri yerleştirme, iptal etme ve işlem yapma işlevlerini içerir.

c. Hesaplama Fonksiyonları: Chadex işlemlerinde kullanılan fiyat, miktar ve işlem hesaplamalarını gerçekleştiren fonksiyonlar burada bulunur.

d. Diğer Yardımcı Fonksiyonlar: Hesaplamalara ve işlemlere yardımcı olan diğer fonksiyonlar burada yer alır.

e. Hata Mesajları: Sözleşme, hata mesajları kullanarak işlem sırasında karşılaşılabilecek sorunları ele alır ve uygun hata mesajlarını döndürür.

* Topluluk Bağış İsteği: Chadex'i kullananların geliştiriciye bağış yapması gerektiği belirtilir.

* Olaylar: ChadexBase sözleşmesinin olayları, sözleşme üzerindeki önemli değişiklikleri veya işlemleri takip etmek için kullanılır.

// Chadex v 0.8.9a-testing: Bu kodun Chadex sürüm 0.8.9a-testing sürümü olduğunu belirtir.

// Deployed to Sepolia: Kodun nerede kullanıldığını veya dağıtıldığını belirten bir açıklama.

* type Account is address;: Bu, özel bir veri türü olan "Account" tanımını oluşturur. Bu tür, Ethereum hesaplarını temsil etmek için "address" türünü kullanır.

* type Factor is uint8;: "Factor" adında başka bir özel veri türü oluşturur. Bu, bir faktörü temsil etmek için kullanılır.

* type OrderKey is bytes32;: "OrderKey" adında başka bir özel veri türü oluşturur. Bu, sipariş anahtarlarını temsil eder.

* type PairKey is bytes32;: "PairKey" adında bir diğer özel veri türüdür ve işlem çifti anahtarlarını temsil eder.

* type Token is address;: "Token" adında bir veri türü oluşturur. Bu, Ethereum'daki tokenları temsil etmek için "address" türünü kullanır.

* type Tokens is int128;: "Tokens" adında bir diğer özel veri türüdür ve miktarları temsil etmek için kullanılır.

* type Unixtime is uint64;: "Unixtime" adında bir tür oluşturur ve zaman damgalarını temsil etmek için "uint64" türünü kullanır.

* enum BuySell { Buy, Sell }: "BuySell" adında bir özel veri türüdür ve "Buy" ve "Sell" olmak üzere iki olası değeri temsil eder. Bu, alım ve satım işlemlerini belirlemek için kullanılır.

* enum Action { FillAny, FillAllOrNothing, FillAnyAndAddOrder, RemoveOrder, UpdateExpiryAndTokens }: "Action" adında bir diğer özel veri türüdür ve belirli işlem türlerini temsil eder. Örneğin, bir siparişi iptal etme veya güncelleme gibi işlem türlerini belirtir.

* interface IERC20 { ... }: "IERC20" adında bir arayüzdür ve ERC-20 uyumlu tokenların işlevlerini içerir. Bu, ERC-20 tokenlarla etkileşime girmek için kullanılır.

* function onePlus(uint x) pure returns (uint) { ... }: "onePlus" adında bir işlevdir ve bir sayıyı 1 artırır. Bu işlev, verilen sayının 1 fazlasını döndürür.

* contract ReentrancyGuard { ... }: "ReentrancyGuard" adında bir sözleşmedir ve yeniden girişi (reentrancy) önlemek için kullanılır. Bu, güvenlik sorunlarını önlemek için kullanılır.

* contract ChadexBase { ... }: "ChadexBase" adında bir ana sözleşmedir ve Chadex DEX platformunun temel işlevselliğini içerir. DEX işlemlerini yönetmek ve izlemek için kullanılır.


* "Factors," "Pair," "OrderQueue," "Order," "TradeInput," "MoreInfo," ve "TradeResult" gibi struct'lar: Hepsi veri-yapısıdır. Örneğin, "Pair" struct'ı işlem çiftlerini temsil ederken, "Order" struct'ı siparişleri temsil eder. Bu veri yapıları, sözleşmenin içindeki verileri düzenli bir şekilde tutmaya yardımcı olur. Ve düzenli bir finans mimarisi ve [market algoritması] oluşturur.

* "uint8 public constant PRICE_DECIMALS = 12;": Bu, bir sabit değişkeni tanımlar ve değerini 12 olarak ayarlar. Bu, fiyatların ondalık basamak sayısını temsil eder.

* "Price public constant PRICE_EMPTY = Price.wrap(0);": "PRICE_EMPTY" adında bir sabit değişkeni tanımlar ve "Price.wrap(0)" ile başlatır. Bu, boş bir fiyatı temsil eder. Yani formatta 0 değerini saklayarak başlangıç değerini sarmalar.

* (Security)"Price public constant PRICE_MIN = Price.wrap(1);": "PRICE_MIN" adında bir diğer sabit değişkeni tanımlar ve "Price.wrap(1)" ile başlatır. Bu, en düşük fiyatı temsil eder. Minimum değerde fiyat belirlemesi sağlar bu ücretsiz transactionları engellemek için de kullanılır.

* "Price public constant PRICE_MAX = Price.wrap(999_999_999_999_999_999_999_999);": "PRICE_MAX" adında bir diğer sabit değişkeni tanımlar ve büyük bir değerle başlatır. Bu, en yüksek fiyatı temsil eder. [Bu kısımı aslında audit ile fixlenmesi gereken bir şey olduğunu düşünüyorum.]

* "Tokens public constant TOKENS_MIN = Tokens.wrap(0);": "TOKENS_MIN" adında bir sabit değişkeni tanımlar ve "Tokens.wrap(0)" ile başlatır. Bu, en düşük token miktarını temsil eder.

* "Tokens public constant TOKENS_MAX = Tokens.wrap(999_999_999_999_999_999_999_999_999_999_999_999);": "TOKENS_MAX" adında bir diğer sabit değişkeni tanımlar ve büyük bir değerle başlatır. Bu, en yüksek token miktarını temsil eder.

* "OrderKey public constant ORDERKEY_SENTINEL = OrderKey.wrap(0x0);": "ORDERKEY_SENTINEL" adında bir sabit değişkeni tanımlar ve "OrderKey.wrap(0x0)" ile başlatır. Bu, bir siparişin bitişini işaret eden bir değeri temsil eder.

* "uint constant TOPIC_LENGTH_MAX = 48;": "TOPIC_LENGTH_MAX" adında bir sabit değişkeni tanımlar ve değerini 48 olarak ayarlar. Bu, mesaj başlıklarının maksimum uzunluğunu belirler.

* "uint constant TEXT_LENGTH_MAX = 280;": "TEXT_LENGTH_MAX" adında bir diğer sabit değişkeni tanımlar ve değerini 280 olarak ayarlar. Bu, mesaj metinlerinin maksimum uzunluğunu belirler.

* "PairKey[] public pairKeys;": "pairKeys" adında bir dinamik dizi tanımlar ve işlem çiftlerinin anahtarlarını içerir.

* "mapping(PairKey => Pair) public pairs;": "pairs" adında bir eşleme tanımlar ve işlem çiftlerini anahtarlarına göre saklar.

* "mapping(PairKey => mapping(BuySell => BokkyPooBahsRedBlackTreeLibrary.Tree)) priceTrees;": "priceTrees" adında bir başka eşleme tanımlar ve fiyat ağaçlarını işlem çifti ve alım/satım türüne göre saklar.

* "mapping(PairKey => mapping(BuySell => mapping(Price => OrderQueue))) orderQueues;": "orderQueues" adında bir diğer eşleme tanımlar ve sipariş sıralarını işlem çifti, alım/satım türü ve fiyatına göre saklar.

* "mapping(OrderKey => Order) orders;": "orders" adında bir diğer eşleme tanımlar ve siparişleri sipariş anahtarlarına göre saklar.

* "event PairAdded(PairKey indexed pairKey, Account maker, Token indexed base, Token indexed quote, uint8 baseDecimals, uint8 quoteDecimals, Factors factors, uint timestamp);": "PairAdded" adında bir olay tanımlar. Bu olay, bir işlem çifti eklenirse tetiklenir ve bu işlem çiftinin ayrıntılarını içerir.

* "event OrderAdded(PairKey indexed pairKey, OrderKey indexed orderKey, Account indexed maker, BuySell buySell, Price price, Unixtime expiry, Tokens tokens, Tokens quoteTokens, uint timestamp);": "OrderAdded" adında bir diğer olay tanımlar. Bu olay, bir sipariş eklenirse tetiklenir ve bu siparişin ayrıntılarını içerir.

* "event OrderRemoved(PairKey indexed pairKey, OrderKey indexed orderKey, Account indexed maker, BuySell buySell, Price price, Tokens tokens, uint timestamp);": //"OrderRemoved" adında bir diğer olay tanımlar. Bu olay, bir sipariş kaldırılınca tetiklenir ve kaldırılan siparişin ayrıntılarını içerir.

* "event OrderUpdated(PairKey indexed pairKey, OrderKey indexed orderKey, Account indexed maker, BuySell buySell, Price price, Unixtime expiry, Tokens tokens, uint timestamp);": "OrderUpdated" adında bir başka olay tanımlar. Bu olay, bir sipariş güncellenirse tetiklenir ve güncellenen siparişin ayrıntılarını içerir.

* "event Trade(TradeResult tradeResult);": "Trade" adında bir olay tanımlar. Bu olay, bir işlem gerçekleştiğinde tetiklenir ve bu işlemin ayrıntılarını içerir.

* "event TradeSummary(PairKey indexed pairKey, Account indexed taker, BuySell buySell, Price price, Tokens tokens, Tokens quoteTokens, Tokens tokensOnOrder, uint timestamp);": "TradeSummary" adında bir başka olay tanımlar. Bu olay, bir işlemin özetini içerir.

* "event Message(address indexed from, address indexed to, bytes32 indexed pairKey, bytes32 orderKey, string topic, string text, uint timestamp);": "Message" adında bir başka olay tanımlar. Bu olay, mesajlar veya bildirimler gönderildiğinde tetiklenir ve iletişimle ilgili bilgileri içerir.
-----------
