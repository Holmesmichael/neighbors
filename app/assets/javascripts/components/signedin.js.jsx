var Signedin = React.createClass({
  
  
    render: function() {
      return (
       <div className="navigation">
         <div className="container">
          
            <div className="navbar navbar-expand-lg navbar-light bg-light fixed-top">
                    <a className="navbar-brand" href="/"><h4>Neighborly</h4></a>
                    <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div className="navbar-nav">
                            <a className="nav-item nav-link" href="/users/edit"><h6>Profile</h6></a>
                            <a className="nav-item nav-link" href="/requests"><h6>Map</h6></a>
                            <a className="nav-item nav-link" href="/conversations"><h6>Messages</h6></a>
                            <a className="nav-item nav-link" href="#"><h6>Logout</h6></a> 

                        </div>
                    </div>
            </div>
          
         </div>
       </div>
          
      );
    }
  });