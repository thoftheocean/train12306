# -*- coding: utf-8 -*-
import datetime

from scrapy.exceptions import IgnoreRequest

class DownloaderMiddleware(object):

    def process_request(self, request, spider):
        
        if "turn" in request.meta:
            turn = request.meta["turn"]
            if turn != spider.turn:
                spider.logger.warning("in midderware, " + request.url +\
                        (" expire. %d %d" % (spider.turn, turn)))
                raise IgnoreRequest()
            else:
                return None

        else:
            return None

















# vim: set ts=4 sw=4 sts=4 tw=100 et:
