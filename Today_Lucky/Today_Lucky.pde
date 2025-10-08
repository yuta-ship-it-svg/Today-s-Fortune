// シンプルおみくじ
String[] fortunes = {"大吉","中吉","小吉","吉","末吉","末小吉",
                     "凶","小凶","半凶","末凶","大凶"};
String result = "";
float r = -1;

int btnX = 245, btnY = 120, btnW = 100, btnH = 60;      // おみくじボタン（右側）
int resetX = 245, resetY = 220, resetW = 100, resetH = 60; // リセットボタン（右側）

PFont font;
PImage omikujiImg;
PImage mikujiImg;

void setup() {
  size(400, 400);
  font = createFont("MS Gothic", 32); 
  textFont(font);
  textAlign(CENTER, CENTER);

  omikujiImg = loadImage("omikuji.png");
  mikujiImg = loadImage("mikuji.png");
}

void draw() {
  background(240);
  imageMode(CENTER);
  
  // 左側に画像表示
  if (result.equals("")) {
    image(omikujiImg, 150, 180, 1100, 950); 
  } else {
    image(mikujiImg, 150, 200, 1100, 950);
    
       // 結果文字を表示
    textSize(32);
    fill(getColor(result));
    text(result, 150, 230);
  }
  
  // ボタンは右側に配置
  if (result.equals("")) {
    // おみくじボタン（結果が出る前だけ）
    fill(255, 255, 0);
    rect(btnX, btnY, btnW, btnH, 10);
    fill(0);
    textSize(20);
    text("スタート", btnX + btnW/2, btnY + btnH/2);
  } else {
    // リセットボタン（結果が出た時だけ）
    fill(200, 200, 255);
    rect(resetX, resetY, resetW, resetH, 10);
    fill(0);
    textSize(20);
    text("リセット", resetX + resetW/2, resetY + resetH/2);
  }
}

void mousePressed() {
  // おみくじボタン（結果が出ていない時だけ有効）
  if (result.equals("") &&
      mouseX > btnX && mouseX < btnX+btnW &&
      mouseY > btnY && mouseY < btnY+btnH) {
      float r = random(100); // 0〜100の乱数
      
      // 確率で結果を決定
    if (r < 5) result = "大吉";
    else if (r < 15) result = "中吉";
    else if (r < 20) result = "小吉";
    else if (r < 35) result = "吉";
    else if (r < 50) result = "末吉";
    else if (r < 65) result = "末小吉";
    else if (r < 75) result = "凶";
    else if (r < 85) result = "小凶";
    else if (r < 90) result = "半凶";
    else if (r < 95) result = "末凶";
    else result = "大凶";
  }
  
     

  // リセットボタン（結果が出ている時だけ有効）
  if (!result.equals("") &&
      mouseX > resetX && mouseX < resetX+resetW &&
      mouseY > resetY && mouseY < resetY+resetH) {
    result = ""; // 最初の画面に戻る
  }
}

// 結果に応じて文字色を返す関数
color getColor(String res) {
  if (res.equals("大吉")) return color(255, 215, 0);     // 金
  if (res.equals("中吉")) return color(128);             // 銀
  if (res.equals("小吉")) return color(165, 42, 42);     // 茶
  if (res.equals("吉")) return color(255, 255, 0);       // 黄
  if (res.equals("半吉")) return color(0, 128, 0);       // 緑
  if (res.equals("末吉")) return color(255,105,180);   // ピンク
  if (res.equals("末小吉")) return color(127, 255,212); // アクアマリン
  if (res.equals("凶")) return color(0, 0,255);         // 青
  if (res.equals("小凶")) return color(128,0,128);      //  紫
  if (res.equals("半凶")) return color(255, 0, 255);     // マゼンタ
  if (res.equals("末凶")) return color(0, 0, 128);       // ネイビー
  if (res.equals("大凶")) return color(0);               // 黒 
  return color(0); // デフォルト黒
}
