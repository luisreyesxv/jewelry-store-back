# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Order.destroy_all
Image.destroy_all
ItemMaterial.destroy_all
ItemCategory.destroy_all
User.destroy_all
Item.destroy_all
Category.destroy_all
Material.destroy_all


u1 = User.create(name: "Luis Reyes",email: "testing@email.com",password:"fakefakefake")
silver = Material.create(name: "silver")
platinum = Material.create(name:"platinum")
gold = Material.create(name: "gold")

ring = Category.create(name: "ring")
grill = Category.create(name:  "grill")
earring = Category.create(name: "earrings")
watch = Category.create(name: "watch")
necklace = Category.create(name: "necklace")


watches_array = [ {
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083982/watches/gold/Watch-PNG-Transparent-HD-Photo_xkdqxo.png"],

    }

},
 {
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083982/watches/gold/RN047_116588TBR-0003_Custom_Diamond_Rolex_Cosmograph_Daytona_Eye_of_the_Tiger_Chronograph_Automatic_Chronometer_Diamond_Men_s_Watch_116588TBR-0003_116588TBR_1024x1024-removebg-pre_wqg0bv.png"]
    }

},
{
    materials: [gold, silver, platinum ],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083982/watches/gold/watch_1_gold_jp5arp.png"],
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083982/watches/silver/watch_1_silver_kweu0s.png"],
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083982/watches/platinum/watch_1_platinum_yfohma.png"]
    }
}
]

earrings_array =[ {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/earrings/gold/Antique-Jewellery-PNG-Background-Image_vfgfqa.png"],
        }
    
    },
    {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083972/earrings/gold/Jewel-Set-PNG-Free-Download_hvbhcc.png"],
        }
    
    },
    {
    materials: [gold, silver ],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083971/earrings/gold/earring_1_gold_1_fhgjjy.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083971/earrings/gold/earring_1_gold_2_plisux.png"],
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083973/earrings/silver/earring_1_silver_1_awtu8b.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/earrings/silver/earring_1_silver_2_ylfzwi.png"],
    }

    },
    {
    materials: [silver ],
    images: {

    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/earrings/silver/919305-removebg-preview_cq56un.png"]
    }

},
{
    materials: [silver ],
    images: {

    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/earrings/silver/Antique-Jewellery-Background-PNG_laikmw.png"]
    }

},
{
    materials: [silver ],
    images: {

    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083972/earrings/silver/932286-removebg-preview_wmvgg4.png"]
    }

},
{
    materials: [ platinum ],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083972/earrings/platinum/earring_2_platinum_1_ad17o1.png"]
    }

},
{
    materials: [ gold ],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083971/earrings/gold/earring_3_gold_1_gt7tbo.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083971/earrings/gold/earring_3_gold_2_qyewds.png"]
    }

}

    ]


grills_array=[ {
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083972/Grills/gold/grill_3__58013.1563568943_kf7rbk.webp"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083971/Grills/gold/grill_10__14071.1563569235_qjgtxi.webp"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083971/Grills/gold/grill_1__44625.1564161070_za6syg.webp"]
    }

},
{
    materials: [platinum],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083973/Grills/platinum/grill_9__94586.1563569200_te2ufw.webp"]
    }

},
{
    materials: [platinum],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083972/Grills/platinum/grill_8__16732.1563665479_urxmne.webp"]
    }

},
{
    materials: [platinum],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083972/Grills/platinum/grill_13__50057.1563569351_ubez6o.webp"]
    }

}

]

necklace_array =[ {
        materials: [gold, platinum ],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/necklace/gold/necklace_1_gold_1_iyyhnj.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/necklace/gold/necklace_1_gold_2_ucejmw.png"],
        platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/platinum/necklace_1_platinum_1_bsh6lv.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/platinum/necklace_1_platinum_2_k6vdep.png"]
        }
    
    }.
    {
        materials: [gold, platinum ],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/necklace/gold/necklace_2_gold_1_nminm7.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/necklace_2_gold_2_wkylfc.png"],
        platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/platinum/necklace_2_platinum_1_qm1bfa.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/platinum/necklace_2_platinum_2_kknwm3.png"]
        }
    
    },
    {
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/necklace_3_gold_1_ldij5w.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/necklace_3_gold_2_bmgrbr.png"]
        }
    },
    {
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/silver/necklace_4_silver_1_s1zn0k.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/silver/necklace_4_silver_2_p7jo6f.png"]
        }
    },
    {
    materials: [gold, platinum ],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/necklace_5_gold_1_xprkqe.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/necklace_5_gold_2_bqtppe.png"],
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/platinum/necklace_5_platinum_1_fgfqg5.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/platinum/necklace_5_platinum_2_przfkj.png"]
    }

},
{
    materials: [gold ],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083973/necklace/gold/Antique-Jewellery-Necklace-PNG-Pic_t3tsin.png"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/necklace/gold/Jewellery-Chain-PNG-Transparent-Image_ceathf.png"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/Necklace-Jewellery-PNG-Picture_hk9ccf.png"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/Necklace-Jewellery-Set-Transparent-Background-PNG_ecndwq.png"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083975/necklace/gold/Necklace-Jewellery-Transparent-Background_qkjrfi.png"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/gold/Necklace-Jewellery-Transparent-PNG_znaozh.png"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/necklace/gold/jewellery-png-transparent-images-5_ljzv8q.png"]
    }

},
{
    materials: [gold],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083974/necklace/gold/jewelry-2563035_640_gmhyeg.png"]
    }

},
{
    materials: [platinum],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/platinum/Jewellery-PNG-File_o1reun.png"]
    }

},
{
    materials: [platinum],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/platinum/unnamed_xygtzt.png"]
    }

},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/necklace/silver/Necklace-Jewellery-PNG-File_yk1rg3.png"]
    }

},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/necklace/silver/Necklace-Jewellery-PNG-Pic_rpin0v.png"]
    }

},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083976/necklace/silver/jewelry-clipart-transparent-background-2_e0ey1x.png"]
    }

}

    ]

rings_array = [ {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/ring/gold/580b585b2edbce24c47b241d_fuyjcb.png"]
        
        }
    
    },
    {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083978/ring/gold/Ring-Jewellery-PNG-File_jgypcu.png"]
        
        }
    
    },
    {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083978/ring/gold/Ring-Jewellery-PNG-Free-Download_wlcttd.png"]
        
        }
    
    },
    {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083979/ring/gold/Ring-Jewellery-PNG-Image_vrnrjz.png"]
        
        }
    
    },
    {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083980/ring/gold/Ring-Jewellery-PNG-Transparent-Image_xv2yg2.png"]
        
        }
    
    },
    {
        materials: [gold],
        images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083980/ring/gold/Ring-Jewellery-Transparent-PNG_fgudg3.png"]
        
        }
    
    },
    {
    materials: [ platinum ],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083979/ring/platinum/Antique-Jewellery-Download-PNG-Image_rdryog.png"]
    }

},
{
    materials: [ platinum ],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083979/ring/platinum/Antique-Jewellery-PNG-Transparent-Image_qlaaz7.png"]
    }

},
{
    materials: [ platinum ],
    images: {
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083980/ring/platinum/Ring-Jewellery-PNG-Clipart_br82bh.png"]
    }

},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083980/ring/silver/BT660WM.jpg_4-removebg-preview_aib56u.png"]
}
},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083981/ring/silver/Jewellery-Ring-PNG-File_p87ahi.png"]
}
},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083980/ring/silver/Jewellery-Ring-PNG-Free-Download_yzbp16.png"]
}
},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083980/ring/silver/Jewellery-Ring-PNG-Image_lbjs9w.png"]
}
},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083981/ring/silver/Jewellery-Ring-Transparent-Background_ozx30z.png"]
}
},
{
    materials: [silver],
    images: {
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083982/ring/silver/Ring-Jewellery-PNG-Pic_do5zse.png"]
}
},
{
    materials: [gold, silver ],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620087669/ring/gold/ring_1_gold_1_xcrdvm.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620087669/ring/gold/ring_1_gold_2_rpk3fw.png"],
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620087835/ring/silver/ring_1_silver_1_oovibi.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620087835/ring/silver/ring_1_silver_2_lxr9nd.png"]
    }

},
{
    materials: [gold,  platinum ],
    images: {
        gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/ring/gold/ring_2_gold_1_sfdkxt.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/ring/gold/ring_2_gold_2_owaj0p.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/ring/gold/ring_2_gold_3_aqncys.png"],
    platinum: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083979/ring/platinum/ring_2_platinum_2_mqf06x.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083979/ring/platinum/ring_2_platinum_3_tfvogb.png"]
    }

},
{
    materials: [gold, silver ],
    images: {
    gold: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/ring/gold/ring_3_gold_1_vpsme4.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083977/ring/gold/ring_3_gold_2_j9x3nz.png"],
    silver: ["https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083981/ring/silver/ring_3_silver_1_n6ytkw.png","https://res.cloudinary.com/dpojhdtrn/image/upload/v1620083981/ring/silver/ring_3_silver_2_uwucd3.png"]
    }

}

    
    
    ]





