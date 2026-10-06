Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F0429CEE
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791322062; cv=none; b=rHjKDBkllDpllWJwhju4X1Jp0fuJyCrkMaS5eSuzpeDjF4zzwKWdchXK4LZtjus3B8nLn2ntJTw98vuDd4uZ3A8+l7GQL8+ETluqnV1Q2VBvWRyVb1XPg+0L9mefoceyfShpOWNUYXuT79G+EUwUPARgm8Jo3RRgoxgA62zmeJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791322062; c=relaxed/simple;
	bh=J518TeBei26VEQXbPGvt3y4HnC5DH/HWj48vtTb4u5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=L/FT1DkBR0XdEq3FVsksaYsoJnQ9xxT4Ox5aGcPs6sEr0t3T/k7AoWimJDb8iYIGYaKWENo2HybETnKnKrRSS3FcCq4gZbW5eFUbFFDPni/6s58/vJenIFVhlEBhzXdnQ19lZDR3lfgRSGzCewP+hFNS5SOi9c3QmiGAnFB4r+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBjFjB8z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBjFjB8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791322060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLYqLTXYL+33FHGPoAQIFrwweKpAyRzDOJvC/lVBZus=;
	b=SBjFjB8zRaUK6rnaA5lL4NhDGpE5ucRECXRg/YFOqoQVkI0PwmCYyoqDP/qq3fOQ9qBR0q
	PtXFw9XBQPzLI6yI7lO+SRWTO6UYp3feDCGCwJWnp4kXCmr9MPVhDTRHG7vXVvdvWNdYop
	iFV6ks+0lvvZEehnJq7bzl6EczS411A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-RnCORhC5PXilnYNY9DaJIA-1; Tue, 06 Oct 2026 17:27:36 -0400
X-MC-Unique: RnCORhC5PXilnYNY9DaJIA-1
X-Mimecast-MFC-AGG-ID: RnCORhC5PXilnYNY9DaJIA_1791322056
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a020cf06c3so20229695e9.3
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 14:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791322055; x=1791926855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLYqLTXYL+33FHGPoAQIFrwweKpAyRzDOJvC/lVBZus=;
        b=LNoz0lteVWHOlO8oMOYwTGvTG1eTjFy0C63kILIBNkUHoAIjr2cQ5MGpp2o5USweTI
         Skp/i82s5Jup0tG1H003OCUvl4O7l7b2gCp3Y/pwunk6FRGmGwXiGuYxRx02wSMpFA4n
         ejLxYLoJNyg9HFQ6fn+VEjldiCEhc3VBbCna8KyKv7qPl+zkAWNOejygGDW+j/A5H/y9
         UiyFlN9kWzALmJ5B1OhQ3IClCT7l+0jL6TkwPeaug8TxZJjWQ0g82Das6/1vNN5n8UqT
         eQWZ9uDrit9EZGsaXR43EpL20W3y4YffGHEXxcWpwuEHPeiWPfH0TVc9W+LRNhKlLlyA
         KWIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6vFAtS7W82RazK0k3ZWSY5rfeivAgE8YgNyIDbtOrgkW7nEsRS1lJc5O90eBRr8ikIvamJ/fOQ7Tb@lists.linux.dev
X-Gm-Message-State: AFuF++kVBll2yIRcyu1/WezKMZ/szLFS5+9B6ILQgW0VpIQ8AnDYIENU
	j1UyqjRmpzi47jJDVUSKMMaxQfUXEV2jAj9M3i1xplzdH8/+uYsDOftUPz/WswZwRe6YJ770BGU
	+L8wzuoShBXYNYsXeUldYDWTwhv7/iYhSsE+snhFFj5iulHnqwsX9yCqJm6xe2JU=
X-Gm-Gg: AYBFou1JYSIsGKfb+yQ0V5BUDNxxStIfVdx9L97TWPS0Ud5sYf9hI+o7lrzdrBpjgd6
	Gara6FptfjRbuoPqfzyitei/kAiYv1VhGWiXZX1bJXH5P5rZt7wxJlhC/iVSi6M+jqV7BlJlXiU
	XYUTL8psUtnHwp2+WACVNzTp5alHXZQkWByhJOoPq9bnLuQ0l3gnskweN0GQR6+hmLkI9jpitaL
	i9aeenHClBuqq8TdJCaZ4vFlqsQorkkHNHUn8MDu535NRARAeZD0kiewF3IM18dfqy0P66njlMI
	kMkYpl6zZTnT29tPip4LBN1h/1Q7oAZusBMoeOTD9lYkS+7FGzZJoyI/+hwbidtdItMfuS0=
X-Received: by 2002:a05:600c:468f:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a1806508edmr1608065e9.30.1791322055557;
        Tue, 06 Oct 2026 14:27:35 -0700 (PDT)
X-Received: by 2002:a05:600c:468f:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a1806508edmr1607885e9.30.1791322055050;
        Tue, 06 Oct 2026 14:27:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f51beffsm14516105e9.2.2026.10.06.14.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:27:34 -0700 (PDT)
Date: Tue, 6 Oct 2026 17:27:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: sungbyeongchan <tjdqudcks0424@naver.com>,
	German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] virtiofs: validate fixed-output response length
Message-ID: <20261006172721-mutt-send-email-mst@kernel.org>
References: <20261004123405.586168-1-tjdqudcks0424@naver.com>
 <20261006182408.1301152-1-tjdqudcks0424@naver.com>
 <2026100633-roping-stardust-a6ab@gregkh>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2026100633-roping-stardust-a6ab@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BUcIV9_lXadzEa2hJ85Mc10OjY7kuAMWbrFDnfCsNSo_1791322056
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 06, 2026 at 11:11:14PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 07, 2026 at 03:24:08AM +0900, sungbyeongchan wrote:
> > A short successful virtiofs response can leave the fixed-output
> > portion of the request argument buffer unwritten. The completion path
> > nevertheless copies the full declared output to the request destination,
> > allowing stale allocator contents to reach callers such as
> > fuse_statfs().
> > 
> > Require successful fixed-output responses to contain their complete
> > declared output. Continue to permit a shorter final argument only for
> > out_argvar requests. Reject positive and internal restart error values,
> > require valid error replies to be header-only, and do not copy output
> > arguments from error replies.
> > 
> > A header-only FUSE_STATFS success returned stale fields in nine of
> > nine calls across three boots. The fixed kernel rejected the short
> > response and preserved complete replies, valid error replies, and
> > variable-output controls.
> > 
> > Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> 
> Real name please.

a missing space I guess?

> > ---
> > Changes in v2:
> > - Reject positive and internal restart error values.
> > - Require error replies to be header-only.
> > - Rate-limit malformed-response warnings.
> > - Rely on the existing FUSE pr_fmt prefix.
> > - Add Cc: stable@vger.kernel.org.
> > - Use the reporter identity consistently.
> > 
> >  fs/fuse/virtio_fs.c | 43 ++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 38 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> > index f15e516ebcb5c..fffbe08d9114a 100644
> > --- a/fs/fuse/virtio_fs.c
> > +++ b/fs/fuse/virtio_fs.c
> > @@ -4,6 +4,8 @@
> >   * Copyright (C) 2018 Red Hat, Inc.
> >   */
> >  
> > +#include "fuse_i.h"
> > +
> 
> Why is this moved?
> 
> 
> 
> >  #include <linux/fs.h>
> >  #include <linux/dax.h>
> >  #include <linux/pci.h>
> > @@ -20,7 +22,6 @@
> >  #include <linux/cleanup.h>
> >  #include <linux/uio.h>
> >  #include "dev.h"
> > -#include "fuse_i.h"
> >  #include "fuse_dev_i.h"
> >  
> >  /* Used to help calculate the FUSE connection's max_pages limit for a request's
> > @@ -730,6 +731,10 @@ static void copy_args_from_argbuf(struct fuse_args *args, struct fuse_req *req)
> >  	unsigned int num_out;
> >  	unsigned int i;
> >  
> > +	/* Error replies contain only the output header. */
> > +	if (req->out.h.error)
> > +		goto out;
> 
> But no error is returned?
> 
> >  	if (len < sizeof(*oh)) {
> > -		pr_warn("virtio-fs: response too short (%u)\n", len);
> > +		pr_warn_ratelimited("response too short (%u)\n", len);
> 
> Isn't these ratelimited() changes separate from the original issue here?
> That should be a separate patch.
> 
> thanks,
> 
> greg k-h

