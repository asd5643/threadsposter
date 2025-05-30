import 'package:flutter/material.dart';
import 'package:threadsposter/models/data_lists.dart';

class ToneSelection extends StatefulWidget {

  final void Function(String)? onToneSelected;
  const ToneSelection({super.key, this.onToneSelected});

  @override
  State<ToneSelection> createState() => _ToneSelectionState();
}

class _ToneSelectionState extends State<ToneSelection> {

  String _selectedTone = 'None';
  void _onToneChanged(String tone) {
    setState(() {
      _selectedTone = tone;
    });

    if (widget.onToneSelected != null) {
      widget.onToneSelected!(tone); // 傳出去
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildToneSelector();
  }

  Widget _buildToneSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '選擇語氣風格',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: toneOptions.map(
                (tone) {
                  return _buildTone(tone);
                }).toList()
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTone(String tag) {
    return TextButton(
      onPressed: () => {
        _onToneChanged(tag)
      },
      child: Chip(
        label: Text(tag),
        backgroundColor: _selectedTone == tag ? Colors.purple : Colors.purple.shade100,
        onDeleted: null,
      ),
    );
  }
  
}