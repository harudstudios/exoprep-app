class LeaderboardModel {
  final int rank;
  final LeaderboardUser user;

  // 🔹 Streak-based fields
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastAttemptDate;

  // 🔹 Score-based fields
  final double totalPoints;
  final double avgScore;

  // 🔹 Common
  final int totalAttempts;

  const LeaderboardModel({
    this.rank = 0,
    this.user = const LeaderboardUser(),

    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastAttemptDate,

    this.totalPoints = 0.0,
    this.avgScore = 0.0,

    this.totalAttempts = 0,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const LeaderboardModel();
    }

    return LeaderboardModel(
      rank: json['rank'] is int ? json['rank'] as int : 0,
      user: LeaderboardUser.fromJson(json['user']),

      // streak-based
      currentStreak: json['current_streak'] is int ? json['current_streak'] as int : 0,
      longestStreak: json['longest_streak'] is int ? json['longest_streak'] as int : 0,
      lastAttemptDate: json['last_attempt_date'] != null ? DateTime.tryParse(json['last_attempt_date'].toString()) : null,

      // score-based
      totalPoints: (json['total_points'] as num?)?.toDouble() ?? 0.0,
      avgScore: (json['avg_score'] as num?)?.toDouble() ?? 0.0,

      totalAttempts: json['total_attempts'] is int ? json['total_attempts'] as int : 0,
    );
  }

  static List<LeaderboardModel> fromList(List<dynamic>? list) {
    if (list == null) return [];

    return list.map((e) => LeaderboardModel.fromJson(e is Map<String, dynamic> ? e : null)).toList();
  }
}

class LeaderboardUser {
  final String id;
  final String name;
  final String email;
  final String profilePic;

  const LeaderboardUser({this.id = '', this.name = '', this.email = '', this.profilePic = ''});

  factory LeaderboardUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const LeaderboardUser();
    }

    return LeaderboardUser(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      profilePic: json['profile_pic']?.toString() ?? '',
    );
  }
}
