ary_tops = [{name: "Tシャツ/カットソー(半袖/袖なし)"},{name: "Tシャツ/カットソー(七分/長袖)"},{name: "その他"}]
ary_jacket = [{name: "テーラードジャケット"},{name: "ノーカラージャケット"},{name: "Gジャン/デニムジャケット"},{name: "その他"}]
ary_shoes = [{name: "スニーカー"},{name: "サンダル"},{name: "その他"}]

default = Category.create(name: "---")

lady = Category.create(name: "レディース")
lady_tops = lady.children.create(name: "トップス")
lady_tops.children.create(ary_tops)
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_jacket.children.create(ary_jacket)
lady_shoes = lady.children.create(name: "靴")
lady_shoes.children.create(ary_shoes)

men = Category.create(name: "メンズ")
men_tops = men.children.create(name: "トップス")
men_tops.children.create(ary_tops)
men_jacket = men.children.create(name: "ジャケット/アウター")
men_jacket.children.create(ary_jacket)
men_shoes = men.children.create(name: "靴")
men_shoes.children.create(ary_shoes)