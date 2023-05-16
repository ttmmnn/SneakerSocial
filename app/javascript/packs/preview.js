if (document.URL.match(/new/)){
  document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('post_image').addEventListener('change', (e) =>{
      const createImageHTML = (blob) => {  
      const imageElement = document.getElementById('new-image'); 
      const blobImage = document.createElement('img'); 
      blobImage.setAttribute('class', 'new-img') 
      blobImage.setAttribute('src', blob); 
      imageElement.appendChild(blobImage);
    }; 
      
    const file = e.target.files[0];  
    const blob = window.URL.createObjectURL(file); 
    createImageHTML(blob); 
    });
  });
}

