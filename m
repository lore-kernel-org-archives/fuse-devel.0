Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44208284B37
	for <fuse-devel@lists.linux.dev>; Sat, 25 Jul 2026 04:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784952106; cv=pass; b=YgHXlB+1hmlRFlXTGLQFfmjtqm82PmdAj9+e5YG+QzoJAxv7YYRlUyA8CEQqVXYOxVN5fFqT1GdoGX8EIo5ex3T8R0SR0Jp2iieknS/GTVHgA3UAFTna0fdX8edFVBimgm6WDInQ8pGhOpC/FJ9dSy41mc6No4YoqIv/PzcaFFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784952106; c=relaxed/simple;
	bh=fNC8wElaBgCywizq8gsw7GvnGpxJrTKPY2EQunJ50fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUqQn+/mNlh+TObpWCPAfXD4ClXFuX0Joh34HFLae7PvH6keG4kR8nD+Qsc/FS5pTmHnubqBSSJ9XdvBVS1/SDyJQAU6caaUOnI1mMJUQrSsbCZhjSXpGk0tJMwJQaRgnXEEFj01mbIjTxLCxln0kMybJSwkCpy1TdMHO/uQyY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=O2DhqZ0k; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="O2DhqZ0k"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-526f963372aso9481441cf.1
        for <fuse-devel@lists.linux.dev>; Fri, 24 Jul 2026 21:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784952103; cv=none;
        d=google.com; s=arc-20260327;
        b=o8ICcowy8UhR9AhKnEEDi/qUfTh5cYpTuvzAOOthVFaEitIyvUhiBvdUvQZVjt+28q
         MWY6CuzMhWoKjFZWxHy4L96k7DeLDk6bNeGf41sUeYrlrITi4J5GwbkCn5RhCSeOuptK
         +K6kLW0ymSVNDHOxMUyaIPwekjrEzzmRuAWde/tvFwy64iOE/+kRxnnfFKia6IL+hGpD
         RIZi6XZPPPycSU5JWte3wXjPmn66W+7W5Fot6n5Ym288boxE4tVYTJcYd3cIfbdIyVls
         pbWy/ZVUkLtrGUAZudfsZslujbtht1+eTjzC8sPiQ5wfzdQO/Ga0Mqu+AVRxRgPpDeb4
         4Ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CzPMjf6pORP572iHiiQv3possHTxsjbSzVUS0tfn1HU=;
        fh=Z5XkL0TBS3Vt+Wi+hT439xxZHLdSEubZoHIMsd6IGp8=;
        b=NY4dgXZIQNYIGygi8IMJTxqcJsKwTvhY1ia2RfcQ4G32mKgrutOI6yeCU0wJoxBhbO
         sj+i41/dAR7Lypa04zu2aXAIuPAL5DbFIm9jjev3Um9C+ARrR0VkZ26/HHqgkY22WqUX
         4666ayCNcQm4bvyX25lbLPYDC7hxQOQ3sQc50/gMBL56CXNGghnG+iMClaxrEqDC2d+o
         CSoFuqe9o9CxFwSpoVZn+/z/OMTlQW1QkM7VrGMiE8BNaKPnzT/kEUhpo4xzkyoztPcv
         tbcnv9cJIhoLImxwuR0uBcyndFZPowdx+jnaK07lC1k3YHNcVeNMJX2AXx0hLhI91zIO
         iktg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784952103; x=1785556903; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzPMjf6pORP572iHiiQv3possHTxsjbSzVUS0tfn1HU=;
        b=O2DhqZ0kZTf9mGFscZhDUZtEF2p0Kiwltncd/zusqTv5JHaFoL7EyW1VQ8JlJDbElM
         kMiMbQm4swIlTePAJBvw5JqVC/N2BKdHjTq18BRHnIYuWh/7abDFnz2oMnsKvAXJ39qb
         pbN5fnA6kVCkp1iy8N7cUGhm8l/o4BQmBMges=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784952103; x=1785556903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CzPMjf6pORP572iHiiQv3possHTxsjbSzVUS0tfn1HU=;
        b=eVWicoOyiEuO6dRD8olBwssaljkyze2JMMrHW3XO+aRZHx5R1kWoTQodCVQsvoqtBa
         MZJvkCdJE/2R84VXhRS96G7hMw3Ovt2wDJNK+7KebuloAoUEnVQ49eOb+KB2aLyKBZmm
         5MwMJKR/vjhR8gBGHpFU967frlu+aQRd/Euw63LyqtMVN1Uigf1k680Dz0gyGk5OPECx
         ngjD2TkzQ20i0LeJaEllK+LNHyQ8u/qCPweicjkIQ4F6aTiBggEg6vu2A/CfVDWzELJi
         lWSKZ8R+Bu8KMuposXQURzSD+EHlrRDA5Cl+u1HoUzyfgRg8tLi4lwix704ns3fve1t7
         DJow==
X-Forwarded-Encrypted: i=1; AHgh+RoD2u8I1j9zihLt4T7QrV8p96BmXyeUBfAe7R+86lM3O4MV6sQuPaYYrlBSd/Y0bknoYUDWAL/znOMD@lists.linux.dev
X-Gm-Message-State: AOJu0YzOgilWfr3rJLIwIy/OS+RX2vztcdaisOs+2rVhj/qmLyCFy6fm
	DJh6NSqcGzAUGqYSt5M3UHNWBHSYi8AJ1izvxCa2bQJnbAzJ5dWNdIbHOo1F4rfUjuKGOVT5gub
	v/6v1RXknEnekEfpM0Bjkzl9cGd+/Hotwqr0mXX1xLQ==
X-Gm-Gg: AR+sD12XcwuIlJ5pavV6u7Lee8gvceSA1MEZivsvgDrEQgMVEaxpIrFeunj1fcANwy6
	DGn3t/TD7UUCzRs14ZmoeOU8xMpQPXWt2b8WlurM0Pd5oOrZLItkzvM3keLuzK/zajnOwE8s8wY
	G+abTc+O3VfsFITphfbFFg5ZDc77ZIUg7oNummhbc/xdoZktdArRdhRgw/qJJsg4ak9iO7I3k1v
	bbMooLTyqkS5vf1K2wACZMIAGSjaGcsWpkI+aTkY2rSyzMZC4K7hJ6qDj1wNPRnXHprH/fiJPqf
	nSGBkU0BnMWw5Z7B
X-Received: by 2002:ac8:5c90:0:b0:51c:7b12:6001 with SMTP id
 d75a77b69052e-529a8714e88mr10045521cf.77.1784952103086; Fri, 24 Jul 2026
 21:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
 <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
 <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com>
 <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com> <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
In-Reply-To: <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Sat, 25 Jul 2026 06:01:30 +0200
X-Gm-Features: AUfX_mxAcvr2jX4Ns3aulDhtsSqUabRQhwz0VnV0bbRi_FBtOFn1nR0cN_FIRKA
Message-ID: <CAJfpeguEptz4sEXq=pBWPFop--1kTDu5p2yZnCyzXcrZ28Nekw@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

(Replying shortly as we are starting now on a two week journey.  Won't
read email during this time).

On Fri, 24 Jul 2026 at 22:23, Joanne Koong <joannelkoong@gmail.com> wrote:

> imo these changes seem doable for making the 7.3 merge window. I'm not
> sure how much bandwidth John has though. Maybe one idea that could
> work if John is completely slammed for time right now is having the
> changes requested above be a separate followup series someone else can
> do and then this current series (after the sashiko fixes) and that
> series can get landed together in the same merge window.

I'm all for it.


>
> >
> > Maybe the striping setup can also be done with a notification.  The
>
> I had interpreted the FUSE_DEV_IOC_STRIPE_OPEN patch as implying that
> the mapping gets forwarded to the kernel through the backing id in the
> open() reply, which I think is how Amir had also interpreted it. I
> didn't like that the striping mappings got sent through an ioctl while
> the simple mappings didn't, but I think maybe the patch was not trying
> to suggest that and I had interpreted it too literally. I like the
> striping setup through an ioctl - I think it makes sense given that it
> is connection-level instead of inode-level.

Yeah, the striping setup is on a different level (like we have with
regular filesystems).  So I think it's not that bad that the setup is
different.

Thanks,
Miklos
