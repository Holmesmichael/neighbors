
var Navigation = React.createClass({
  
  
    render: function() {
      return (
       <div className="navigation">
         <div className="container">
          
            <div className="navbar navbar-expand-lg navbar-light bg-light fixed-top">
                    <a className="navbar-brand" href="/"><h6>Neighborly</h6></a>
                    <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div className="navbar-nav">
                            <a className="nav-item nav-link" href="/users/sign_in"><h6>Sign In</h6></a>
                            <a className="nav-item nav-link" href="/users/sign_up"><h6>Sign Up</h6></a>
                        </div>
                    </div>
            </div>
          
         </div>
       </div>
          
      );
    }
  });
  

