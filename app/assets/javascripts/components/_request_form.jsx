class RequestForm extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        title: props.request.title,
        description: props.request.description,
        address: props.request.address
      };
      this.handleTitleChange = this.handleTitleChange.bind(this);
      this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
      this.handleAddressChange = this.handleAddressChange.bind(this);
    }
  
    handleTitleChange(e) {
      this.setState({ title: e.target.value });
    }
  
    handleDescriptionChange(e) {
      this.setState({ description: e.target.value });
    }

    handleAddressChange(e) {
        this.setState({ address: e.target.value });
      }
  
    render() {
      return (
        <div>
          <label>Title</label>
          <input
            type="text"
            name="request[title]"
            value={this.state.title}
            onChange={this.handleTitleChange}
          />
  
          <label>Description</label>
          <input
            type="text"
            name="request[description]"
            value={this.state.description}
            onChange={this.handleDescriptionChange}
          />

          <label>Address</label>
          <input
            type="text"
            name="request[address]"
            value={this.state.address}
            onChange={this.handleAddressChange}
          />
  
          <input type="submit" value="Update Request" />
        </div>
      );
    }
  }