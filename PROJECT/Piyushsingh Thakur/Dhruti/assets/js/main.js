
(function() {
  "use strict";
  /**
   * Easy selector helper function
   */
  const select = (el, all = false) => {
    el = el.trim()
    if (all) {
      return [...document.querySelectorAll(el)]
    } else {
      return document.querySelector(el)
    }
  }

  /**
   * Easy event listener function
   */
  const on = (type, el, listener, all = false) => {
    let selectEl = select(el, all)
    if (selectEl) {
      if (all) {
        selectEl.forEach(e => e.addEventListener(type, listener))
      } else {
        selectEl.addEventListener(type, listener)
      }
    }
  }

  /**
   * Easy on scroll event listener 
   */
  const onscroll = (el, listener) => {
    el.addEventListener('scroll', listener)
  }

  /**
   * Navbar links active state on scroll
   */
  let navbarlinks = select('#navbar .scrollto', true)
  const navbarlinksActive = () => {
    let position = window.scrollY + 200
    navbarlinks.forEach(navbarlink => {
      if (!navbarlink.hash) return
      let section = select(navbarlink.hash)
      if (!section) return
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        navbarlink.classList.add('active')
      } else {
        navbarlink.classList.remove('active')
      }
    })
  }
  window.addEventListener('load', navbarlinksActive)
  onscroll(document, navbarlinksActive)

  /**
   * Scrolls to an element with header offset
   */
  const scrollto = (el) => {
    let header = select('#header')
    let offset = header.offsetHeight

    let elementPos = select(el).offsetTop
    window.scrollTo({
      top: elementPos - offset,
      behavior: 'smooth'
    })
  }

  /**
   * Toggle .header-scrolled class to #header when page is scrolled
   */
  let selectHeader = select('#header')
  let selectTopbar = select('#topbar')
  if (selectHeader) {
    const headerScrolled = () => {
      if (window.scrollY > 100) {
        selectHeader.classList.add('header-scrolled')
        if (selectTopbar) {
          selectTopbar.classList.add('topbar-scrolled')
        }
      } else {
        selectHeader.classList.remove('header-scrolled')
        if (selectTopbar) {
          selectTopbar.classList.remove('topbar-scrolled')
        }
      }
    }
    window.addEventListener('load', headerScrolled)
    onscroll(document, headerScrolled)
  }

  /**
   * Back to top button
   */
  let backtotop = select('.back-to-top')
  if (backtotop) {
    const toggleBacktotop = () => {
      if (window.scrollY > 100) {
        backtotop.classList.add('active')
      } else {
        backtotop.classList.remove('active')
      }
    }
    window.addEventListener('load', toggleBacktotop)
    onscroll(document, toggleBacktotop)
  }

  /**
   * Mobile nav toggle
   */
  on('click', '.mobile-nav-toggle', function(e) {
    select('#navbar').classList.toggle('navbar-mobile')
    this.classList.toggle('fa-list')
    this.classList.toggle('fa-x')
  })

  /**
   * Mobile nav dropdowns activate
   */
  on('click', '.navbar .dropdown > a', function(e) {
    if (select('#navbar').classList.contains('navbar-mobile')) {
      e.preventDefault()
      this.nextElementSibling.classList.toggle('dropdown-active')
    }
  }, true)

  /**
   * Scrool with ofset on links with a class name .scrollto
   */
  on('click', '.scrollto', function(e) {
    if (select(this.hash)) {
      e.preventDefault()

      let navbar = select('#navbar')
      if (navbar.classList.contains('navbar-mobile')) {
        navbar.classList.remove('navbar-mobile')
        let navbarToggle = select('.mobile-nav-toggle')
        navbarToggle.classList.toggle('fa-list')
        navbarToggle.classList.toggle('fa-x')
      }
      scrollto(this.hash)
    }
  }, true)

  

  /**
   * Hero carousel indicators
   */
  let heroCarouselIndicators = select("#hero-carousel-indicators")
  let heroCarouselItems = select('#heroCarousel .carousel-item', true)

  heroCarouselItems.forEach((item, index) => {
    (index === 0) ?
    heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "' class='active'></li>":
      heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "'></li>"
  });


})()

      /*
   book table
   */
   const storedata = e =>{
                      let formdata = JSON.parse(localStorage.getItem('formdata')) || [];
                      let exit = formdata.length && 
                      JSON.parse(localStorage.getItem('formdata')).some(data => data.date.toLowerCase() == document.getElementById('date').value.toLowerCase() && data.time.toLowerCase() == document.getElementById('time').value.toLowerCase());
                      if (!exit){
                      formdata.push({
                        Name: document.getElementById('name').value,
                        email: document.getElementById('email').value,
                        phone: document.getElementById('phone').value,
                        date: document.getElementById('date').value,
                        time: document.getElementById('time').value,
                        people: document.getElementById('people').value,
                        message: document.getElementById('msg').value
                      });
                      localStorage.setItem('formdata',JSON.stringify(formdata));
                      //console.log(localStorage.getItem('formdata'));
                        dispdata();
                      document.querySelector('form').reset();
                      document.getElementById('name').focus();
                    }
                    else{
                      alert("duplicate data or booked table");
                    }
                      e.preventDefault();     
  }

   function dispdata(){
                              console.log(localStorage.getItem('formdata'));
                              if(localStorage.getItem('formdata')){
                                var output = document.querySelector('tbody');
                                output.innerHTML = "";
                                JSON.parse(localStorage.getItem('formdata')).forEach(data => {
                                  output.innerHTML +=`
                                  <tr>
                                            <td>${data.Name}</td>
                                            <td>${data.email}</td>
                                            <td>${data.phone}</td>
                                            <td>${data.date}</td>
                                            <td>${data.time}</td>
                                            <td>${data.people}</td>
                                            <td>${data.message}</td>
                                  </tr>`;
                                });
                              }
                        }
  dispdata();



    /*
    contact table*/
  const newdata =n=>{
    let formdata={
      Name: document.getElementById('Name').value,
      email: document.getElementById('Email').value,
      subject: document.getElementById('subject').value,
      message: document.getElementById('msgs').value
    }
    localStorage.setItem('Answer',JSON.stringify(formdata));
    //console.log(localStorage.getItem('formdata'));
    n.preventDefault();
    document.getElementById('demo').reset();
    document.getElementById('Name').focus();
   }


