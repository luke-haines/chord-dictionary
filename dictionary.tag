<dictionary>
    <img src={img_path} id="fingering"><br/>
    <select id="chord-name">
        <option each={option in options} value={option.value} selected={current==option.value}>{option.title}</option>
    </select>
    <script>
        var _this = this;
        _this.options = [
            {value: 'c-major.png', title: 'C'},
            {value: 'd-flat-major.png', title: 'C♯/D♭' },
            {value: 'd-major.png', title: 'D'},
            {value: 'e-flat-major.png', title: 'D♯/E♭' },
            {value: 'e-major.png', title: 'E'},
            {value: 'f-major.png', title: 'F'},
            {value: 'g-flat-major.png', title: 'F♯/G♭' },
            {value: 'g-major.png', title: 'G'},
            {value: 'a-flat-major.png', title: 'G♯/A♭' },
            {value: 'a-major.png', title: 'A'},
            {value: 'b-flat-major.png', title: 'A♯/B♭' },
            {value: 'b-major.png', title: 'B'}
        ];
        _this.img_path = 'images/c-major.png';

        _this.on('mount', function(){
            $('#chord-name').change(function () {
                _this.img_path = 'images/' + $("#chord-name").val();
                _this.update();
            });
        });
    </script>
</dictionary>
