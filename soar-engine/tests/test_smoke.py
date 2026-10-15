import soar_engine


def test_package_exposes_version() -> None:
    assert soar_engine.__version__
