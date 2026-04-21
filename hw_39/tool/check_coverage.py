from pathlib import Path
import sys


KEY_FILES = {
    "lib/features/notes/data/mappers/note_mapper.dart": 100,
    "lib/features/notes/domain/usecases/add_note_use_case.dart": 100,
    "lib/core/result/result.dart": 100,
}


def parse_lcov(path: Path) -> dict[str, tuple[int, int]]:
    coverage: dict[str, tuple[int, int]] = {}
    content = path.read_text().split("end_of_record")

    for block in content:
        lines = [line for line in block.strip().splitlines() if line]
        if not lines:
            continue

        source_file = next(
            (line[3:] for line in lines if line.startswith("SF:")),
            None,
        )
        if source_file is None:
            continue

        da_lines = [line for line in lines if line.startswith("DA:")]
        total = len(da_lines)
        hit = sum(1 for line in da_lines if int(line.split(",")[1]) > 0)
        coverage[source_file] = (hit, total)

    return coverage


def main() -> int:
    lcov_path = Path("coverage/lcov.info")
    if not lcov_path.exists():
        print("coverage/lcov.info not found. Run: flutter test --coverage")
        return 1

    coverage_data = parse_lcov(lcov_path)
    has_errors = False

    for source_file, min_percent in KEY_FILES.items():
        hit, total = coverage_data.get(source_file, (0, 0))
        percent = (100 * hit / total) if total else 0

        print(f"{source_file}: {hit}/{total} ({percent:.0f}%)")
        if percent < min_percent:
            has_errors = True
            print(
                f"  -> below threshold: expected at least {min_percent}%",
            )

    return 1 if has_errors else 0


if __name__ == "__main__":
    sys.exit(main())
