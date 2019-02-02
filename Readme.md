# Gnucap-Python Docker container (Spice for Jupyter)

Overview:

* Dockerfile: enables a user to run Jupyter and gnucap on all docker supported platforms (Win/Unix/Mac)
* Jupyter notebook: simple example of loading gnucap-python
* Spice circuit examples: work in progress, but basic example of DC sweep works, will play a bit more with that



Start with:

    $ docker run -it -v <working_dir>:/home/gnucap/work -p 8888:8888 gnucap bash
    # jupyter notebook --ip 0.0.0.0 --no-browser --allow-root


<image src="sim_pulse.png" />
<image src="http://blog.farsinotare.com/media/images/pn_plot.PNG" />

License
MIT
