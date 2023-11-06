import 'package:flutter/material.dart';
import '../model/diary_entry_model.dart';
import '../controller/diary_entry_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../views/add_edit_diary_entry_view.dart';
import 'package:intl/intl.dart';

class DiaryListView extends StatelessWidget {
  final DiaryEntryService diaryController = DiaryEntryService();

  DiaryListView({Key? key}) : super(key: key);

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  Widget _buildEntryWidget(BuildContext context, DiaryEntry entry) {
    return ListTile(
      title: Text(DateFormat('yyyy-MM-dd').format(entry.date)),
      subtitle: Text(entry.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Rating: ${entry.rating}'),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              diaryController.deleteDiaryEntry(entry.date);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Entries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddEntryView(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: StreamBuilder<List<DiaryEntry>>(
        stream: diaryController.getDiaryEntries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No diary entries found.'));
          }
          final entries = snapshot.data!;
          entries.sort((a, b) => b.date.compareTo(a.date)); // Sort by date

          DateTime? lastDate;
          List<Widget> widgets = [];
          for (var entry in entries) {
            if (lastDate == null || entry.date.month != lastDate.month || entry.date.year != lastDate.year) {
              final headerText = DateFormat('MMMM yyyy').format(entry.date);
              widgets.add(DateHeader(text: headerText));
            }
            widgets.add(_buildEntryWidget(context, entry));
            lastDate = entry.date;
          }

          return ListView(children: widgets);
        },
      ),
    );
  }
}

class DateHeader extends StatelessWidget {
  final String text;

  const DateHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}


















/*import 'package:flutter/material.dart';
import '../model/diary_entry_model.dart';
import '../controller/diary_entry_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../views/add_edit_diary_entry_view.dart';
import 'package:intl/intl.dart';


class DiaryListView extends StatelessWidget {
  final DiaryEntryService diaryController = DiaryEntryService();

  DiaryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Entries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // TODO: Redirect to login screen or handle the user sign out state.
            },
          ),
        ],
      ),
      body: StreamBuilder<List<DiaryEntry>>(
        stream: diaryController.getDiaryEntries(), // Use the diaryController instance
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Center the progress indicator
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No diary entries found.'));
          }
          final entries = snapshot.data!;
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text(entry.date.toString()),
                subtitle: Text(entry.description),
                trailing: Text('Rating: ${entry.rating}'),
                // TODO: In the future, edit and delete buttons can be added here.
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEntryView()), // Assuming AddEditDiaryEntryView is the correct widget to add a new entry
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/