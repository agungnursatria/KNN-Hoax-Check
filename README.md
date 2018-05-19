# KNN-Hoax-Check
1.	Deskripsi Masalah
Dalam menentukan keputusan untuk memilih satu atau beberapa objek terdekat dari suatu tempat maka dibutuhkan informasi mengenai jarak dari suatu titik ke beberapa alternatif tempat pilihan tersebut. Informasi jarak yang valid akan menuntun keputusan ke arah yang benar. Pada umumnya pencarian jarak terdekat dilakukan dengan menggunakan pengukuran euclidean distance, namun pada kenyataannya sebuah objek di dunia nyata hanya bisa dicapai melalui jalan yang menghubungkannya dengan objek lainnya, sehingga jarak yang valid untuk mendapatkan objek terdekat seharusnya adalah jarak jalan atau network distance, bukan euclidean distance.

2.	Rancangan Metode
Langkah-langkah:
1.	Inisialisasi data train dan data test pada program
2.	Tentukan jarak antara masing” data train dengan data test menggunakan euclidean atau manhattan distance
3.	Sorting jarak-jarak yang sudah didapat dari terdekat (terkecil) ke terjauh
4.	Pilih data yg telah disorting sebanyak “k” dari jarak terdekat ke jarak terjauh
5.	Tentukan apakah data test hoax atau tidak dengan melihat data yang telah dipiih, jika data yang dipilih lebih banyak hoax, maka maka data test saat ini merupakan hoax
6.	Ulangi langkah 2-5 hingga kehoax-an seluruh data test diketahui

