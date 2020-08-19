import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
              
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: valueController,
            ),
            FlatButton(
              onPressed: _submitForm,
              child: Text(
                'Nova Transação',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
