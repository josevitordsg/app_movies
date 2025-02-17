import 'package:app_movies/data/app_data.dart';
import 'package:app_movies/models/category.dart';
import 'package:app_movies/providers/list_all_movies.dart';
import 'package:app_movies/utils/create_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
class AddMovies extends ConsumerStatefulWidget {
  AddMovies({super.key});

  @override
  ConsumerState<AddMovies> createState() => _AddMoviesState();
}

class _AddMoviesState extends ConsumerState<AddMovies> {
  final _formkey = GlobalKey<FormState>();
  var selectedCategory = 'c1';
  var enteredTitle = '';
  var enteredDuration = '';
  var enteredRelease = ''; 
  var enteredSynopsis = '';
  var enteredImageUrl = '';

  final imagePicker = ImagePicker();
  bool saveIsLoading = false;
  
  File? selectImage = null;
  String? imageUrl = null;
  void _saveItem() async{
    if(_formkey.currentState!.validate() && selectImage !=null){
      setState(() {
        saveIsLoading = true;
      });
      await uploadImage();
      _formkey.currentState!.save();
       final url = Uri.https('projetoapppobreflix-default-rtdb.firebaseio.com', 'all-movies.json');

      var response = await http.post(
        url,
        headers:{
          'Content-Type': 'application/json',
        },
        body: json.encode(
            {
              'title': enteredTitle,
              'duration': enteredDuration,
              'category': selectedCategory,
              'release': enteredRelease,
              'synopsis': enteredSynopsis,
              'imageUrl':imageUrl,
              'location': '',
              'sceneUrl': '',
              'curiosity': ''
            }
        )
      );
      print(response.statusCode);
      ref.read(listMovies.notifier).loadMovies(); // atualiza o provider
      if(!context.mounted){
        return;
      }
      Navigator.of(context).pop();
    } else if(selectImage == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(
            child: Text('Select an image for the movie!'),
          )
        ),
      );
    }
  }
  Future<void> takePicture() async{
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if(pickedImage == null){
      return;
    }
    setState(() {
      selectImage = File(pickedImage.path);
      print("deu certo");
    });
  }
  Future <void> uploadImage() async{
    if (selectImage == null){
      print("Nenhuma imagem selecionada.");
      return;

    }
    print("Imagem selecionada: ${selectImage!.path}");
    try{
      print('entrou');
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';

      final ref = FirebaseStorage.instance.ref().child(fileName);
      try {
        print("Iniciando upload...");
        await ref.putFile(selectImage!);
        print("Upload concluído.");
      } catch (e) {
        print("Erro durante o upload: $e");
        // Se for um erro do Firebase, pode ser útil ver a mensagem do erro
        if (e is FirebaseException) {
          print("Erro do Firebase: ${e.message}");
        }
      }
      String downloadUrl = await ref.getDownloadURL();
      
      setState(() {
        imageUrl = downloadUrl;
      });

      print("Imagem carregada com sucesso! $imageUrl");
    }catch(e){
      print("Erro ao enviar imagem: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, "New movie"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text(
                          "Enter the title of the film",
                          style: TextStyle(color: Colors.white38)
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 2 ||
                            value.trim().length > 50) {
                          return 'Must be between 2 and 50 characters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        enteredTitle = value!;
                      },
                    
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Realease',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      keyboardType:  TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        label: Text("Enter movie release date", style: TextStyle(color: Colors.white38)),
                        floatingLabelBehavior: FloatingLabelBehavior.never
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null){
                          return 'Release cannot be null';
                        }else if(int.tryParse(value)! > 2025|| int.tryParse(value)!<1895){
                          return "Invalid year";
                        }
                        return null;
                      },
                      onSaved: (value){
                        enteredRelease = value!;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Duration',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      keyboardType:  TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        label: Text("Enter the duration of the film", style: TextStyle(color: Colors.white38),),
                        floatingLabelBehavior: FloatingLabelBehavior.never
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0){
                          return 'Duration invalid';
                        }
                        return null;
                      },
                      onSaved: (value){
                        enteredDuration = value!;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Synopsis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      maxLength: 100,
                      decoration: const InputDecoration(
                        label: Text("Insert film synopsis", style: TextStyle(color: Colors.white38)),
                        floatingLabelBehavior: FloatingLabelBehavior.never
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length <= 10 ||
                            value.trim().length > 100) {
                          return 'Must be between 10 and 50 characters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        enteredSynopsis = value!;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Poster (image)',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:  const Color.fromARGB(255, 112, 110, 110),
                          width: 1.5
                        ),
                        
                      ),
                      child: selectImage == null
                      ? TextButton.icon(
                          icon: const Icon(Icons.photo),
                          onPressed: takePicture, 
                          label: const Text('Select from gallery'),
                        )
                      : Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 43, 44, 54), 
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Stack(
                          children: [
                             Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.file(selectImage!, width: 70,height: 70,),
                                  SizedBox(width: 5,),
                                     Expanded(
                                       child: Text(
                                        path.basename(selectImage!.path),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                     ),
                                ],
                              ),
                            Positioned(
                              top: -9,
                              right: -14,
                              child: IconButton(
                                onPressed: (){
                                  setState(() {
                                    selectImage = null;
                                  });
                                }, 
                                icon: Icon(Icons.highlight_remove_rounded, color: Colors.red,)
                              )
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButtonFormField(
                      value: selectedCategory,
                      items: [
                        for (Category category in moviesCategories)
                          DropdownMenuItem(
                            value: category.id,
                            child: Text(category.title)
                          )
                      ], 
                      onChanged: (value){
                        setState(() {
                          selectedCategory = value!;
                        });
                      }
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: (){
                    _saveItem();
                  },
                  child: saveIsLoading == false
                    ? Text("Save", style: TextStyle(color: Colors.white, fontSize: 14.5),)
                    : CircularProgressIndicator(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    backgroundColor: const Color.fromARGB(255, 212, 18, 4),
                  ),
                )
              ],
            )
          ),
        ),
      )

    );
  }
}