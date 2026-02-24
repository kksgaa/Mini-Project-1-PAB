import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_store.dart';
import '../models/car.dart';
import '../main.dart';

class CarFormScreen extends StatefulWidget {
  final Car? car;
  const CarFormScreen({super.key, this.car});

  @override
  State<CarFormScreen> createState() => _CarFormScreenState();
}

class _CarFormScreenState extends State<CarFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _colorCtrl;
  late TextEditingController _noteCtrl; // TextField ke-3

  bool get isEditing => widget.car != null;

  @override
  void initState() {
    super.initState();
    _nameCtrl  = TextEditingController(text: widget.car?.name ?? '');
    _colorCtrl = TextEditingController(text: widget.car?.color ?? '');
    _noteCtrl  = TextEditingController(text: widget.car?.note ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _colorCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final store = context.read<AppStore>();

    if (isEditing) {
      final updated = widget.car!.copyWith(
        name:  _nameCtrl.text.trim(),
        color: _colorCtrl.text.trim(),
        note:  _noteCtrl.text.trim(),
      );
      store.updateCar(updated);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Mobil berhasil diperbarui!')));
    } else {
      final car = Car(
        id:    DateTime.now().millisecondsSinceEpoch.toString(),
        name:  _nameCtrl.text.trim(),
        color: _colorCtrl.text.trim(),
        note:  _noteCtrl.text.trim(),
      );
      store.addCar(car);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Mobil berhasil ditambahkan!')));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Mobil' : 'Tambah Mobil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 100, height: 100,
                  decoration: BoxDecoration(
                    color: kPrimaryLight.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.directions_car, color: kPrimary, size: 60),
                ),
              ),
              const SizedBox(height: 28),

              _label('Nama Mobil *'),
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  hintText: 'Contoh: Ferrari SF90',
                  prefixIcon: Icon(Icons.label),
                ),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),

              _label('Warna *'),
              TextFormField(
                controller: _colorCtrl,
                decoration: const InputDecoration(
                  hintText: 'Contoh: Merah',
                  prefixIcon: Icon(Icons.palette),
                ),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Warna tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),

              _label('Keterangan Tambahan'),
              TextFormField(
                controller: _noteCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Contoh: Kondisi baru, edisi terbatas, dll.',
                  prefixIcon: Icon(Icons.notes),
                ),
              ),
              const SizedBox(height: 16),

              _label('Harga Sewa'),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kPrimaryLight.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.attach_money, color: kPrimary),
                    SizedBox(width: 12),
                    Text(
                      'Rp 20.000 / 15 menit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: kPrimary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _save,
                  icon: Icon(isEditing ? Icons.save : Icons.add),
                  label: Text(
                    isEditing ? 'Simpan Perubahan' : 'Tambah Mobil',
                    style: const TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      );
}
