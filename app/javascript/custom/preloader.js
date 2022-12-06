class Preloader {
    constructor() {
        this.element = document.querySelector("#loader");
        this.element.style.display = 'grid';
        this.hide();
        console.log('preloader')
    }


    hide() {
        setTimeout(() => {
            this.element.style.display = 'none';
        }, 1000)
    }
}

export default Preloader;
