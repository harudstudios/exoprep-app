import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:root/src/features/flash_cards/subfeatures/decks_view/cubit/decks_view_cubit.dart';
import 'package:root/src/features/flash_cards/subfeatures/decks_view/view/decks_list_view.dart';

class DecksListScreen extends StatefulWidget {
  const DecksListScreen({super.key, required this.collectionId, required this.collectionName});

  final String collectionId;
  final String collectionName;

  @override
  State<DecksListScreen> createState() => _DecksListScreenState();
}

class _DecksListScreenState extends State<DecksListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DecksViewCubit(collectionId: widget.collectionId),
      child: DecksListView(collectionId: widget.collectionId, collectionName: widget.collectionName),
    );
  }
}
