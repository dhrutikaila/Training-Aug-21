const gulp = require("gulp");
const browserSync = require("browser-sync").create();
const sass = require("gulp-sass")(require("sass"));

gulp.task("sass", function () {
    return gulp
        .src(["node_modules/bootstrap/scss/bootstrap.scss", "src/scss/*.scss"])
        .pipe(sass())
        .pipe(gulp.dest("src/css"))
        .pipe(browserSync.stream())
});

//move to js file to src/js

gulp.task("js", function () {
    return gulp.src([
        "node_modules/bootstrap/dist/js/bootstrap.min.js",
        "node_modules/jquery/dist/jquery.min.js",
        "node_modules/@popperjs/core/dist/umd/popper.min.js",
        "node_modules/owl.carousel/dist/owl.carousel.min.js"
    ])
        .pipe(gulp.dest("src/js"))
        .pipe(browserSync.stream())
});

//watch sass and serve

gulp.task("serve", gulp.series("sass", function () {
    browserSync.init({
        server: "./src/"
    });

    gulp.watch(
        ["node_modules/bootstrap/scss/bootstrap.scss", "src/scss/*.scss"],
        gulp.series("sass")
    );
    gulp.watch("src/*.html").on("change", browserSync.reload);
}));

//move fonts to src/fonts
gulp.task("fonts", function () {
    return gulp
        .src("node_modules/@fortawesome/fontawesome-free/webfonts/*")
        .pipe(gulp.dest("src/webfonts"));
});

//move font awesome css to src/css
gulp.task("fa", function () {
    return gulp
        .src("node_modules/@fortawesome/fontawesome-free/css/all.min.css")
        .pipe(gulp.dest("src/css"));
});

//move owl carousel css to src/css
gulp.task("owl",function() {
    return gulp
        .src("node_modules/owl.carousel/dist/assets/owl.carousel.min.css")
        .pipe(gulp.dest("src/css"));
})


gulp.task("default", gulp.series("fa","owl", "fonts", "js", "serve"));