enum PemuputUpacara {
  familyMember,
  pemangku,
  pedanda;

  int get id {
    switch (this) {
      case PemuputUpacara.familyMember:
        return 1;
      case PemuputUpacara.pemangku:
        return 2;
      case PemuputUpacara.pedanda:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case PemuputUpacara.familyMember:
        return "Anggota Keluarga";
      case PemuputUpacara.pemangku:
        return "Mangku";
      case PemuputUpacara.pedanda:
        return "Pedanda";
    }
  }

  static PemuputUpacara? getPamuputUpacaraFromId(int id) {
    switch (id) {
      case 1:
        return PemuputUpacara.familyMember;
      case 2:
        return PemuputUpacara.pemangku;
      case 3:
        return PemuputUpacara.pedanda;
      default:
        return null;
    }
  }
}
