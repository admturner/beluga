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

## 1.2.0 (2020-08-10)

### Features

- 🐳 Create `beluga` entrypoint script and supporting lifecycle scripts with commands to manage the Docker containers. (545b88c)
- ✨ Add mailhog service for managing WP system emails. (96f6096d)
- ✨ Add phpmyadmin service for direct database access (ed047d7)

### Code Quality

- Fix yml file spacing.

### Documentation

- 📝 Update readme with new script instructions. (87b66dd)

## 1.1.1 (2020-07-29)

### Bug Fixes

:bug: Fix #1 modify file permissions to give system user access.

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
