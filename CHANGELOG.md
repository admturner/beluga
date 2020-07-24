# Beluga

<!--
Changelog formatting (http://semver.org/)

## Major.MinorAddorDeprec.Bugfix YYYY-MM-DD

### Features
### Enhancements
### Bug Fixes
### Experiments
### Deprecations
### Code Quality
### Documentation
### Build Tooling
### Project Management
-->

## 1.1.0-beta.1 (:construction: 2020-07-24)

### Enhancements

- Use environment variable fallback values for when `.env` isn't found.

## 1.0.0 (2020-07-24)

### Features

- Add environment variables example file for database credentials.
- Add Docker Compose file with MySQL database and WordPress images, a shared DB volume, and WordPress content volume.

### Enhancements

- Add `uploads.ini` file, mapped to image `conf.d` directory, to increase default WP upload limit size.

### Code Quality

- Add `.editorconfig` file to manage coding style.

### Documentation

- 📝 Add readme, license, and changelog files.

### Project Management

- Tell Docker to ignore the `.env` file.
- ✅ Add Github issue and pull request templates. (3e5f2a9)
- Add Git configuration files.
