import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();

  List<Map<String, String>> todos = [];

  void _addTodo() {
    final nama = _namaController.text.trim();
    final tanggal = _tanggalController.text.trim();

    if (nama.isEmpty || tanggal.isEmpty) return;

    setState(() {
      todos.add({'nama': nama, 'tanggal': tanggal});
      _namaController.clear();
      _tanggalController.clear();
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input 1: Nama Kegiatan
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                hintText: "Nama Kegiatan",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Input 2: Tanggal Kegiatan
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(
                hintText: "Tanggal Kegiatan (cth: 15-10-2026)",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tombol Tambah
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addTodo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Tambah',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // List tugas
            Expanded(
              child: todos.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada tugas.\nTambahkan kegiatan di atas!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.separated(
                      itemCount: todos.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            border: Border.all(color: Colors.blue.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.circle, size: 10, color: Colors.blue),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      todos[index]['nama']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      todos[index]['tanggal']!,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 12),

            // Jumlah tugas
            Text(
              'Jumlah Tugas: ${todos.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
