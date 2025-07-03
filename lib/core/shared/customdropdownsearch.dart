import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {

  final String? title;
  final List<SelectedListItem<String>> listData;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedId;

  const CustomDropDownSearch({super.key, this.title, required this.listData, required this.dropDownSelectedName, required this.dropDownSelectedId});
  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {

  void showDropDownSearch(){
    DropDownState<String>(
      dropDown: DropDown<String>(
        isDismissible: true,
        bottomSheetTitle:  Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        data: widget.listData,
        onSelected: (selectedItems) {
          SelectedListItem selectedListItem = selectedItems[0];
          // widget.dropDownSelectedName.text = selectedListItem.data;

          List<String> parts = selectedListItem.data.split('.');
          widget.dropDownSelectedName.text = parts[1];
          widget.dropDownSelectedId.text = parts[0];




          print("++++++++++++++++++++++++");
          print(widget.dropDownSelectedName.text);
          print(widget.dropDownSelectedId.text);
          print("++++++++++++++++++++++++");
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropDownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
          hintText: widget.dropDownSelectedName.text == "" ? widget.title : widget.dropDownSelectedName.text,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(widget.dropDownSelectedName.text == "" ? widget.title! : widget.dropDownSelectedName.text)),
          suffixIcon: InkWell(onTap: (){}, child: const Icon(Icons.arrow_drop_down)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      // decoration: InputDecoration(
      //   filled: true,
      //   fillColor: Colors.black12,
      //   contentPadding: const EdgeInsets.only(
      //     left: 8,
      //     bottom: 0,
      //     top: 0,
      //     right: 15,
      //   ),
      //   hintText: widget.dropDownSelectedName.text == "" ? widget.title : widget.dropDownSelectedName.text,
      //   border: const OutlineInputBorder(
      //     borderSide: BorderSide(
      //       width: 0,
      //       style: BorderStyle.none,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      // ),
    );
  }
}


