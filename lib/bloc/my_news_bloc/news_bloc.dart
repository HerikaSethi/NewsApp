import 'package:news_app/bloc/my_news_bloc/news_event.dart';
import 'package:news_app/bloc/my_news_bloc/news_state.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    //on load news event trigger
    on<LoadNews>(
      (event, emit) async {
        // initially - loading...
        emit(NewsLoading());
        try {
          // fetch data from repo
          final data = await newsRepository.fetchNews();
          print(data);
          // loaded - complete
          emit(NewsLoaded(data));
        } catch (e) {
          emit(NewsError());
        }
      },
    );
  }

  @override
void onTransition(Transition<NewsEvent, NewsState> transition) {
  super.onTransition(transition);
  print(transition.currentState);
  print(transition.nextState);
}
}
