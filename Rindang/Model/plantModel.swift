//
//  plantModel.swift
//  Rindang
//
//  Created by Aldino Grasepta on 29/08/20.
//  Copyright © 2020 Aldino Grasepta. All rights reserved.
//

import Foundation
import UIKit


struct Plant {
    var name : String
    var sub : String
    var gambar : UIImage
    var deskripsi : String
    var instruksi : String
    var cahaya : String
    var air : String
    var masalah : String
    var status = false
}

class tumbuhan {
    static let sharedInstance = tumbuhan()
    var plantStock:[Plant] = [
        Plant(name: "Sansevieria trifasciata",
              sub: "Lidah mertua",
              gambar: #imageLiteral(resourceName: "snake-plant-care-overview-1902772-04-76c211bb8d1b461e8af30a68b6169535"),
              deskripsi: "Sansevieria trifasciata (Lidah Mertua) adalah salah satu spesies tanaman hias yang paling populer. Dengan daun kaku yang berkisar dari enam inci hingga delapan kaki tinggi, tergantung pada varietasnya. Tanaman Lidah Mertua biasanya memiliki batas kuning.",
              instruksi: "Sansevieria mudah tumbuh. mereka akan tumbuh subur di sudut-sudut rumah yang sangat terang atau hampir gelap. Tanaman hias yang ideal, dan akan tumbuh dengan baik di lantai atau di layar meja. Tanaman ini juga tahan kekeringan.",
              cahaya: "Cahaya Rendah",
              air: "Disiram tiap bulan",
              masalah: "Tanaman ini cukup beracun bagi manusia, anjing, dan kucing. Jika mereka menelan tanaman itu, manusia mungkin menderita gejala jangka pendek termasuk sakit mulut, air liur, dan mual. Dalam kasus yang jarang terjadi, dapat menghasilkan reaksi dermatologis tetapi terutama beracun hanya jika tertelan"),
        Plant(name: "Echinocactus grusonii",
              sub: "Kaktus barel",
              gambar: #imageLiteral(resourceName: "grow-echinocactus-indoors-1902973-05-2801eb30019f4a33bc70acf2c7ca02eb"),
              deskripsi: "Kaktus barel adalah nama lain dari tanaman ini. Seperti namanya, hampir bulat sempurna saat masih muda, jadi tanaman ini bisa menjadi tanaman display yang sangat bagus. tanaman ini sangat menarik, dengan baris atau duri yang berjarak sama di lobus yang sangat bergaris. ",
              instruksi: "Tanaman gurun seperti ini tidak dapat menangani genangan air saat tumbuh. Tanam di tanah dengan drainase yang sangat baik atau campuran pot. Saat ditanam di dalam ruangan, tanaman ini akan membutuhkan lokasi paling terang dan paling cerah.",
              cahaya: "Cahaya Tinggi",
              air: "Disiram tiap bulan",
              masalah: "Masalah pada tanaman ini jarang terjadi, tetapi kadang-kadang mungkin penuh dengan kutu putih. Menyemprot dengan air, kemudian melapisi dengan sabun insektisida adalah obat terbaik."),
        Plant(name: "Aloe Vera",
              sub: "Lidah Buaya",
              gambar: #imageLiteral(resourceName: "_DSC58741-476b7f7ef66d44ba8ce33cbc0d7b8dd4"),
              deskripsi: "Lidah buaya biasanya ditanam sebagai tanaman hias dan disukai karena gel dari daunnya membuat salep kulit yang menenangkan, meski beberapa orang malah teriritasi oleh gel tersebut.",
              instruksi: "Karena lidah buaya membutuhkan tanah berpasir atau berkerikil, ketika ditanam di luar ruangan paling baik. Untuk memadukan lidah buaya ke dalam tanaman hias, buat pot secara terpisah dan gunakan sebagai titik fokus dalam ruangan. Menaikkan pot ke ketinggian mata akan membuatnya lebih menonjol.",
              cahaya: "Cahaya Sedang",
              air: "Disiram tiap minggu",
              masalah: "Tidak banyak hama atau masalah yang mempengaruhi jaman lidah buaya. Membusuk adalah masalah paling umum dengan lidah buaya. Perhatikan layu daun dan air atau tahan air sesuai kebutuhan.")
    ]
    var plant:[Plant] = []
    var selectedPlant: Plant = Plant(name: "", sub: "", gambar: #imageLiteral(resourceName: "snake-plant-care-overview-1902772-04-76c211bb8d1b461e8af30a68b6169535"), deskripsi: "", instruksi: "", cahaya: "", air: "", masalah: "")
    var listTumbuhanTemp:[Plant] = []
    var listKebun:[Plant] = []
    var listStored:[String] = []
    
}
