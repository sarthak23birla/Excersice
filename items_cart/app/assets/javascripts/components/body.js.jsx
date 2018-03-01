class Body extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            items: []
        };
    }
    removeItemClient(id){
        var newItems = this.state.items.filter((item) => {
            return item.id != id;
        });
        this.setState({ items: newItems });
    }

    handleDelete(id){
        $.ajax({
            url:`/api/v1/items/${id}`,
            type: 'DELETE',
            success:() => {
                this.removeItemClient(id);
            }
        });
    }
    
    componentWillMount() {
        $.getJSON('/api/v1/items.json', (response) => { this.setState({ items: response }) })
    }
   
    handleSubmit(item) {
       var newState = this.state.items.concat(item);
       this.setState({items: newState})
    }
    handleUpdate(item){
        $.ajax({
            url: `/api/v1/items/${item.id}`,
            type: 'PUT', 
            data: { item: item }, 
            success: () => {
                this.updateItems(item);
            }
        })
    }
    updateItems(item){
        var items = this.state.items
        this.setState({items: items}); 
    }
   render(){
            return( 
                <div>
                    <AllItem items={this.state.items} handleDelete={this.handleDelete.bind(this)} onUpdate={this.handleUpdate.bind(this)}/>
                    <NewItem handleSubmit={this.handleSubmit.bind(this)} />
                </div>
            )
    }
}