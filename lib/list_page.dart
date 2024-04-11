import 'package:cross/dialog.dart';
import 'package:cross/list_model.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<ListModel> list = [ListModel(group: 'SE-2217', name: 'Rakhat', id: 0)];
  final TextEditingController groupController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                    groupController: groupController,
                    nameController: nameController,
                    callback: () {
                      ListModel model = ListModel(
                          id: list.length,
                          name: nameController.text,
                          group: groupController.text);
                      setState(() {
                        list.add(model);
                      });
                    });
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Row(
                      children: [
                        Text(
                          list[index].name,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          list[index].group,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 200,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        groupController.text =
                                            list[index].group;
                                        nameController.text = list[index].name;
                                        return CustomDialog(
                                            groupController: groupController,
                                            nameController: nameController,
                                            btnText: 'Update',
                                            callback: () {
                                              if (nameController.text.isEmpty ||
                                                  groupController.text.isEmpty)
                                                return;
                                              ListModel model = list[index]
                                                  .copyWith(
                                                      name: nameController.text,
                                                      group:
                                                          groupController.text);
                                              list.removeAt(index);
                                              list.insert(index, model);
                                              setState(() {});
                                            });
                                      },
                                    );
                                  },
                                  child: const Text('Update')),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                list.removeAt(index);
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ]),
                    ));
              }),
        ));
  }
}
