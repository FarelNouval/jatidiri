// lib/screens/tes_cerdas.dart
import 'package:flutter/material.dart';
import 'dart:async';

// Data dummy untuk pertanyaan
class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

// Data pertanyaan (contoh 5 pertanyaan, bisa ditambah hingga 50)
final List<Question> questions = [
  Question(
    question: 'Bulan lalu pada awal tahun ini adalah',
    options: ['Januari', 'Maret', 'Juli', 'Desember', 'Oktober'],
    correctAnswer: 1,
  ),
  Question(
    question: 'MENANGKAP adalah lawan kata dari',
    options: ['Meletakkan', 'Membebaskan', 'Beresiko', 'Berusaha', 'Turun Tingkat'],
    correctAnswer: 2,
  ),
  Question(
    question: 'MENUAI adalah lawan kata dari',
    options: ['Mendapat', 'Bersorak', 'Melanjutkan', 'Berada', 'Menabur'],
    correctAnswer: 5,
  ),
  Question(
    question: 'Berapa hasil dari 23 x 4?',
    options: ['88', '90', '92', '94', '96'],
    correctAnswer: 3,
  ),
  Question(
    question: 'Kata yang memiliki arti sama dengan CEPAT adalah',
    options: ['Lambat', 'Kilat', 'Pelan', 'Santai', 'Tenang'],
    correctAnswer: 2,
  ),
];

// ========================================
// INSTRUCTION SCREENS (1-5) - Sama seperti sebelumnya
// ========================================

class TestCerdasInstruction1Screen extends StatelessWidget {
  const TestCerdasInstruction1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E5FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Tes',
                                style: TextStyle(
                                  color: Color(0xFF6B7FFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Jatidiri Cerdas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6B7FFF).withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Transform.scale(
                                scale: 1.9,
                                child: Transform.translate(
                                  offset: const Offset(10, -5),
                                  child: Image.asset(
                                    'assets/images/tescerdas1.png',
                                    height: 220,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          Icons.edit_note,
                                          size: 80,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 32),

                            const Text(
                              'Intruksi Pengerjaan Tes Kecerdasan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'Tes ini berisi 50 pertanyaan yang secara bertahap menjadi semakin sulit. Anda tidak mungkin dapat menyelesaikan semua pertanyaan, tetapi selesaikan semampu Anda.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestCerdasInstruction2Screen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestCerdasInstruction2Screen extends StatelessWidget {
  const TestCerdasInstruction2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E5FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Tes',
                                style: TextStyle(
                                  color: Color(0xFF6B7FFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Jatidiri Cerdas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6B7FFF).withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Transform.scale(
                                scale: 1.9,
                                child: Transform.translate(
                                  offset: const Offset(10, -5),
                                  child: Image.asset(
                                    'assets/images/tescerdas2.png',
                                    height: 220,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 60,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(height: 8),
                                            Icon(
                                              Icons.person,
                                              size: 60,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 32),

                            const Text(
                              'Intruksi Pengerjaan Tes Kecerdasan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'Anda memiliki waktu 12 menit untuk memberi jawaban yang benar sebanyak mungkin. Kerjakan dengan teliti, namun jangan menghabiskan waktu lama pada setiap pertanyaan atau lewati pertanyaan itu.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestCerdasInstruction3Screen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestCerdasInstruction3Screen extends StatelessWidget {
  const TestCerdasInstruction3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E5FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Tes',
                                style: TextStyle(
                                  color: Color(0xFF6B7FFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Jatidiri Cerdas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6B7FFF).withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 270,
                              child: SingleChildScrollView(
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Transform.translate(
                                    offset: const Offset(-4, -25),
                                    child: Image.asset(
                                      'assets/images/tescerdas3.png',
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          height: 250,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: const Icon(
                                            Icons.edit_note,
                                            size: 80,
                                            color: Colors.grey,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            const Text(
                              'Intruksi Pengerjaan Tes Kecerdasan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'Sebelum anda mulai tes ini, cobalah untuk menjawab contoh soal berikut ini.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestCerdasInstruction4Screen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestCerdasInstruction4Screen extends StatelessWidget {
  const TestCerdasInstruction4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E5FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Tes',
                                style: TextStyle(
                                  color: Color(0xFF6B7FFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Jatidiri Cerdas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6B7FFF).withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Contoh Soal',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.help_outline,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'MENUAI adalah lawan kata dari…',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 16),

                            _buildOption('1. Mendapat'),
                            _buildOption('2. Bersorak'),
                            _buildOption('3. Melanjutkan'),
                            _buildOption('4. Berada'),
                            _buildOption('5. Menabur'),

                            const SizedBox(height: 20),

                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Masukan Jawaban!',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF6B7FFF),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            Text(
                              'Jawaban yang benar adalah "menabur". Maka, isi angka 5 pada form jawaban diatas.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red[600],
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestCerdasInstruction5Screen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class TestCerdasInstruction5Screen extends StatelessWidget {
  const TestCerdasInstruction5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E5FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Tes',
                                style: TextStyle(
                                  color: Color(0xFF6B7FFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Jatidiri Cerdas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6B7FFF).withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Contoh Soal',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.help_outline,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'Harga setiap kotak paper clip adalah 23 rupiah. Berapa harga 4 kotak?...',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(height: 20),

                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Masukan Jawaban!',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF6B7FFF),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            Text(
                              'Jawabannya adalah Rp.92. Isi lah angka \'Rp. 92\' pada form jawaban diatas.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red[600],
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to actual test
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestCerdasQuestionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================
// QUESTION SCREEN - Halaman Tes Sebenarnya
// ========================================

class TestCerdasQuestionScreen extends StatefulWidget {
  const TestCerdasQuestionScreen({super.key});

  @override
  State<TestCerdasQuestionScreen> createState() => _TestCerdasQuestionScreenState();
}

class _TestCerdasQuestionScreenState extends State<TestCerdasQuestionScreen> {
  int currentQuestionIndex = 0;
  final TextEditingController _answerController = TextEditingController();
  List<String> userAnswers = List.filled(questions.length, '');
  
  // Timer
  Timer? _timer;
  int secondsRemaining = 720; // 12 menit = 720 detik

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        _showTimeUpDialog();
      }
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Waktu Habis!'),
        content: const Text('Waktu test telah habis. Test akan diselesaikan.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _finishTest();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _finishTest() {
  _timer?.cancel();
  
  // Navigate ke Result Screen 1
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => TestCerdasResult1Screen(
        totalScore: userAnswers.where((a) => a.isNotEmpty).length,
        userAnswers: userAnswers,
      ),
    ),
  );
}

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')} Min';
  }

  void _nextQuestion() {
    // Save answer
    userAnswers[currentQuestionIndex] = _answerController.text;
    
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        _answerController.text = userAnswers[currentQuestionIndex];
      });
    } else {
      _timer?.cancel();
      _finishTest();
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      // Save current answer
      userAnswers[currentQuestionIndex] = _answerController.text;
      
      setState(() {
        currentQuestionIndex--;
        _answerController.text = userAnswers[currentQuestionIndex];
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final hasAnswer = _answerController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  
                  // Badge
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8E5FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Tes',
                            style: TextStyle(
                              color: Color(0xFF6B7FFF),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Jatidiri Cerdas',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Timer and Bookmark
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 1,
                          vertical: 1,
                        ),
                        
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              color: Color(0xFF6B7FFF),
                              size: 16,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              _formatTime(secondsRemaining),
                              style: const TextStyle(
                                color: Color(0xFF6B7FFF),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 32,
                        height: 32,
                        
                        child: const Icon(
                          Icons.access_alarm,
                          color: Color(0xFF6B7FFF),
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: (currentQuestionIndex + 1) / questions.length,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF6B7FFF),
                      ),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),

            // Question Container
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6B7FFF).withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Header
                      Row(
                        children: [
                          Text(
                            'Pertanyaan ${currentQuestionIndex + 1} dari ${questions.length}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.help_outline,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Question
                      Text(
                        currentQuestion.question,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Options
                      ...List.generate(
                        currentQuestion.options.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '${index + 1}. ${currentQuestion.options[index]}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Answer Input
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: hasAnswer 
                              ? const Color(0xFFE8E5FF)
                              : Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: hasAnswer
                            ? const Color(0xFF6B7FFF) // 🔹 warna border saat sudah diisi
          : Colors.grey[300]!,       // 🔹 warna border default
      width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: _answerController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: hasAnswer 
                                ? const Color(0xFF6B7FFF)
                                : Colors.grey[400],
                          ),
                          decoration: InputDecoration(
                            hintText: 'Masukan Jawaban!',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Back Button
                  if (currentQuestionIndex > 0)
                    Container(
                      width: 56,
                      height: 56,
                      margin: const EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        onPressed: _previousQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6B7FFF),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                          ),
                          elevation: 0,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                        ),
                      ),
                    ),

                  // Next Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: hasAnswer ? _nextQuestion : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hasAnswer 
                            ? const Color(0xFF6B7FFF)
                            : Colors.grey[400],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        ),
                        elevation: 0,
                        disabledBackgroundColor: Colors.grey[400],
                        disabledForegroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Selanjutnya',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================
// RESULT SCREEN 1 WIDGET
// ========================================
// Copy widget ini ke file tes_cerdas.dart Anda

class TestCerdasResult1Screen extends StatelessWidget {
  final int totalScore;
  final List<String> userAnswers;

  const TestCerdasResult1Screen({
    super.key,
    required this.totalScore,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    
                    // Badge
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8E5FF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Hasil',
                              style: TextStyle(
                                color: Color(0xFF6B7FFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Jatidiri Cerdas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                   // Progress Bar Section
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    // 🔹 Baris atas: teks "1/2" dan ikon note
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1/2',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 20,
          height: 20,
          child: Image.asset(
            'assets/images/iconnotetescerdas.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),

    const SizedBox(height: 6),

    // 🔹 Progress bar di bawah
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: 0.5,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation<Color>(
          Color(0xFF6B7FFF),
        ),
        minHeight: 6,
      ),
    ),
  ],
),


                    const SizedBox(height: 24),

                    // Main Content Container
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6B7FFF).withOpacity(0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Illustration
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Transform.scale(
                                scale: 1.6,
                                child: Transform.translate(
                                  offset: const Offset(10, -5),
                                  child: Image.asset(
                                    'assets/images/tescerdas4.png',
                                    height: 220,
                                    fit: BoxFit.contain,
                        
                                  ),
                                ),
                              ),
                            ),

                          const SizedBox(height: 24),

                          // Result Text
                          const Text(
                            'Kamu telah selesai melakukan Test IQ dan mendapatkan hasil IQ sebesar 80 Yang dimana score IQ tersebut tergolong kategori Kurang',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              height: 1.6,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Catatan Section
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Catatan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Bullet Points
                          _buildBulletPoint(
                            'IQ biasanya mengikuti distribusi normal (kurva lonceng), dengan sebagian besar populasi memiliki IQ sekitar rata-rata (100).',
                          ),
                          _buildBulletPoint(
                            'Banyak faktor yang dapat mempengaruhi IQ, termasuk lingkungan, pendidikan, dan genetik.',
                          ),
                          _buildBulletPoint(
                            'IQ adalah salah satu ukuran kecerdasan, tetapi tidak mencakup aspek-aspek lain seperti kreativitas, keterampilan sosial, atau kecerdasan emosional.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestCerdasResult2Screen(
                          totalScore: totalScore,
                          userAnswers: userAnswers,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ========================================
// RESULT SCREEN 2 WIDGET
// ========================================
// Copy widget ini ke file tes_cerdas.dart Anda

class TestCerdasResult2Screen extends StatefulWidget {
  final int totalScore;
  final List<String> userAnswers;

  const TestCerdasResult2Screen({
    super.key,
    required this.totalScore,
    required this.userAnswers,
  });

  @override
  State<TestCerdasResult2Screen> createState() => _TestCerdasResult2ScreenState();
}

class _TestCerdasResult2ScreenState extends State<TestCerdasResult2Screen> {
  int? expandedIndex;

  final List<Map<String, String>> categories = [
    {
      'title': 'Kategori Baik Sekali (Superior)',
      'desc': 'IQ di atas 119 termasuk dalam kategori "Baik Sekali" atau disebut "Superior." Orang yang masuk dalam kategori ini memiliki kemampuan intelektual yang sangat tinggi dibandingkan populasi umum. Mereka cenderung mudah memahami informasi yang kompleks, berpikir secara analitis, dan mampu memecahkan masalah dengan cepat. Biasanya, mereka dapat unggul di berbagai bidang akademis dan profesional yang memerlukan tingkat pemikiran yang tinggi.',
    },
    {
      'title': 'Kategori Baik (Bright Normal)',
      'desc': 'IQ antara 110-119 termasuk dalam kategori "Baik" atau "Bright Normal." Individu dengan IQ dalam rentang ini memiliki kemampuan kognitif di atas rata-rata dan dapat menangani tugas-tugas yang memerlukan pemikiran kritis dengan baik.',
    },
    {
      'title': 'Kategori Cukup (Average)',
      'desc': 'IQ antara 90-109 termasuk dalam kategori "Cukup" atau "Average." Mayoritas populasi berada dalam kategori ini, yang menunjukkan kemampuan kognitif yang normal dan memadai untuk sebagian besar tugas sehari-hari.',
    },
    {
      'title': 'Kategori Kurang (Dull Normal)',
      'desc': 'IQ antara 80-89 termasuk dalam kategori "Kurang" atau "Dull Normal." Individu dalam kategori ini mungkin mengalami kesulitan dengan tugas-tugas yang kompleks tetapi masih dapat berfungsi secara mandiri dalam kehidupan sehari-hari.',
    },
    {
      'title': 'Kategori Kurang Sekali (Borderline)',
      'desc': 'IQ antara 70-79 termasuk dalam kategori "Kurang Sekali" atau "Borderline." Orang dengan IQ dalam rentang ini mungkin memerlukan bantuan tambahan dalam pembelajaran dan kehidupan sehari-hari.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    
                    // Badge
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8E5FF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Hasil',
                              style: TextStyle(
                                color: Color(0xFF6B7FFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Jatidiri Cerdas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Progress Bar
                    Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    // 🔹 Baris atas: teks "1/2" dan ikon note
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '2/2',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 20,
          height: 20,
          child: Image.asset(
            'assets/images/iconnotetescerdas.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),

    const SizedBox(height: 6),

    // 🔹 Progress bar di bawah
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: 1,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation<Color>(
          Color(0xFF6B7FFF),
        ),
        minHeight: 6,
      ),
    ),
  ],
),

                    const SizedBox(height: 24),

                    // Category List
                    ...List.generate(
                      categories.length,
                      (index) => _buildCategoryItem(
                        index,
                        categories[index]['title']!,
                        categories[index]['desc']!,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Download Button
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(
                        color: const Color(0xFF6B7FFF),
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: Implement PDF download
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Download PDF feature coming soon'),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.file_download_outlined,
                        color: Color(0xFF6B7FFF),
                        size: 24,
                      ),
                    ),
                  ),

                  // Finish Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B7FFF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Selesai',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(int index, String title, String description) {
    final isExpanded = expandedIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6B7FFF).withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                expandedIndex = isExpanded ? null : index;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6B7FFF),
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded 
                        ? Icons.keyboard_arrow_up 
                        : Icons.keyboard_arrow_down,
                    color: const Color(0xFF6B7FFF),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                  height: 1.6,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

