Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278B40A95F
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341181; cv=pass; b=BvRwEQTCSSpIKaJ8RGmrlbhffFQ+yrWQxa0kbcDBd1KWB3otQHCSSO+fcTmOukrzOE6ZU/6P6F3DuMvvjWNsk86cH4zExnYlUeijdr7H/iUKxvzDhIAwr7bCp0IXDKjhgkU+fA34hT5a85tKddoVK5mTNEKK9QWAFuQDIb/JZi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341181; c=relaxed/simple;
	bh=2QaAsriM6IS3lTgDPUOF48nwqc8aTC29sa5P2y66CZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvFO/YyjcvD1ReQcRJqU+eP5mwBZ14D1nt+GhIOTVYLUoLXrzhKxSS0bTr3NfYOT+MSMwRLHcvgxdmF9qo/SsOtIgVWJicfIk/bF57iOi0hnuPB1H/sJEzRRuYVpveh/sUEKXc0WV9YTAneo8Ah3opuWQpzc1VdGZfjFzdblkvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=mQeL9GCo; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="mQeL9GCo"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51bfad59921so8438441cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 12:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787341178; cv=none;
        d=google.com; s=arc-20260327;
        b=isAaXAGY+U3iATysqRNu78lmz/QeGt3zYmckm2k2BaQu1dXdXULYW124xXmysN9aIn
         2Z2fM0OwaVMizOvExYwrumiGQRbw2Niu14/crEHBQVJNf9mghkzw6CGcWgY3S5DQnFR1
         wVUoS1qWTqpmx5yhjD7SDp23RH1xfX/VmWUFtjWzLAkOW6CHwRyi2eunoNlTHHfZLy1n
         6b9kSYd4puyFbBpMJ9tM5adfNfUg04jrH6UpzmktUk84dTeFabf/9Djcbd3DRqYgsQQ5
         Mj/+FEef3YLwBDd8JT9neUXcW1gHX1PpTB6IHyhwrPfFI0ZOKxd3nkg7IdHTs4f59z1G
         IopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KUV4QsUdOhj/C4gedxjcRezZM90WK5l233fM+QINPEo=;
        fh=jWRr/CG4Jnh7TO3lFIBerOcg3Hfc0pn8FajE97A0ruU=;
        b=K8DisUlh+89G3yaFFn/3GfWokwhbjzKeNcq/+mplIlbX68rqlcgrZC096Claza3P7X
         tgBFIWLWtxkraXjdVyWnUv3lEZMuuWh+s+0CXTLVL7tEaHoTa6U3xj3xazTVVBn1ZkZw
         8YZ6v1rmvAUdSeFmRhfp4ipdUYi0IhJUt87GFT1DdrJ8WIyxGGiAsFMzbR4/3FWLBw3g
         btzgzOl9iboLtkgv2drPaO8tjvpwi6G50btP8/z/+3I30/SRnV3AYSWIpeqhSqQ3vx8R
         65fkuM7/MRLRK4QRLP7gLKDQamAJn18nURf5b8e5RHDtnAJJa8GvR++05QzbmJT70aYh
         B5/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787341178; x=1787945978; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUV4QsUdOhj/C4gedxjcRezZM90WK5l233fM+QINPEo=;
        b=mQeL9GCoFxkza2lAYix+dA594MljsVKaN/TPELf1NkbVPKSKL4xGW+UkkXmwhcCdDV
         +gLQmmtteCQv7nVbiFF9wsAu0FUSqPXftOkV93ugrTeYW+O+aE4GOtJkpFacY+N/T9dK
         hW+NPr9mnZAGl6qXfrMYYGxVp2qIzIptsM1yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787341178; x=1787945978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KUV4QsUdOhj/C4gedxjcRezZM90WK5l233fM+QINPEo=;
        b=N722Zgqk1KGwBW/r8/GB21crp0PEfyfQ56sBFcdNiEatWG8p0Ivh/8PHlIFk2xw1aT
         3AYsN7BrAUWi+A/FzHL/k5xr9UM/QULHv5/yojrPtk2EReH1+W6UxfrLYSoJUw4TZrlQ
         zedjDYzIaCezDnADR3z8hw7yxoziM6gNUxHYYZ2l1F51179csnTTuhpHqdcfaaTYZm8m
         W/0GfUmuSHLedROHRcpnnLEEJO0iaj/UE+zqOMwbjqK7u0B57r/2cS4dGdByD+pP/gl0
         gOJmObEMUkA46s5ZtBQBmZPhsqg4mPyq8wc42W0f4Sl+l2zKyCFf2/pbrtENk/tEHzIk
         YfxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPSamhbETxvvWg+3diyKD0MD2PF5rHUiJEVMGn5jqHnYclQhCgS3xQRqBfHVrxgcCEOop4whCyQ/mM@lists.linux.dev
X-Gm-Message-State: AFuF++lAh6RU/beOr0pElYmB85zbj+7rQMd7dx59ay7DuiTcOqvod/Yc
	1D2/EwMFo53yIeMj4nJGCz5fNq8H3NR1wrf5QymymW9rarlJU8o0AE1XEflQAmQQ4rLVvV1ofl9
	9YIJ9Z1XPxDWke7kLcVAGJwIuLmFMn5CtQQZhzrPDJA==
X-Gm-Gg: AR+sD13sa4yNwU3cQjO7YUAI/WYlvMx7kKub15y+2PPhFj4PxKecHhKvH2XE/8rdSVf
	AbP4Gg8U2/Xv4Iz0fNrx9wmFKIuKYak4jgRTOfUh2/V4hqqU8u/oyU2RHfaOS/6P45wuYFTXuRf
	UI8pjEsdDi23aHc+ovhio4vNVyFhqT6q/wJ+BE76jdKfhv/NA0ZrYl3f0MbKqpYMtnzIsCj+JNB
	Ccqy68spLwUVzg+g7eqlCcQpR/r8KqLaHzUYwouqUDj8SCL9S1x/bgwf874f+0AXUxwJvMWoieV
	qr0Yl3zOdU5H5708N8kpnfWbn6iAeBNdIAgpVKpvTiNn7C2bAKFpbmV2x+DEkFfrT6jXrYemLv7
	W8z5qmWegCeATmktn9sRekX054Hpw/ZXT
X-Received: by 2002:a05:622a:1f8a:b0:51c:1532:ae93 with SMTP id
 d75a77b69052e-52df5a32867mr88198341cf.26.1787341177980; Fri, 21 Aug 2026
 12:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
 <20260803022828.75776-1-john@jagalactic.com> <0100019fc5739e5d-bc002300-eede-4c40-9ca8-a277b754496e-000000@email.amazonses.com>
 <20260806043712.GB3560084@frogsfrogsfrogs> <CAJfpegtW4bFn=oNfTipCxhiExaqSXnhXeBd6Uq15FpepqCJaPQ@mail.gmail.com>
 <20260811-baugebiet-hofiert-fanden-3354f4a5e820@brauner> <ab642f3a-e377-4292-b2ff-bc970f5384e8@kernel.org>
In-Reply-To: <ab642f3a-e377-4292-b2ff-bc970f5384e8@kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 21 Aug 2026 21:39:26 +0200
X-Gm-Features: AcwNN1V5lCcm6_l8LY5VakD6tTocDvE06I1hYgFmfavubxTv285rgBmrPN7M8XY
Message-ID: <CAJfpegsC-D0AJij3E=dbKzZCH0nijE7+rpPut-EnRd3r0uCMtg@mail.gmail.com>
Subject: Re: [PATCH V12 02/12] famfs: Module operations, fs_context, and mount
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	John Groves <john@jagalactic.com>, John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ira Weiny <iweiny@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Haren Myneni <haren@linux.ibm.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Gabriel Whigham <gabewhigham@gmail.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 13:40, David Hildenbrand (Arm) <david@kernel.org> wrote:

> (a) Whether a fuse-based approach is feasible.
>
>     Are there any major blockers remaining?

No.

> (b) Whether a fuse-based approach is inefficient.
>
>     Are there scenarios remaining where performance or metadata overhead would
>     be bad without an easy way to improve the situation?

Lookups can be cached, extent mappings can also be cached.   After the
inode is in cache and the mapping is set up zero requests are needed
for open/mmap/read/write/close.

> (c) Whether a fuse-based approach is a bad conceptual fit.
>
>     Will fuse have to carry a lot of famfs special sauce that cannot
>     really be used elsewhere / generalized?

None.

But "can" and "will" are not the same.  The striping code might not be
very useful outside of famfs.

> (d) Whether a fuse-based approach is too invasive.
>
>     Will fuse extensions to support famfs actually make it harder to maintain or
>     slower on some paths?

No.

> (e) Whether a fuse-based approach will make famfs harder to extend.
>
>     Is there known follow-up work that will be hard/impossible to model in fuse?

It would actually make famfs much easier to extend, since the
directory structure, metadata, etc. is now controllable within the
userspace server.

> (f) Whether a fuse-based approach will reduce maintenance effor
>
>     Will maintaining fuse extensions possibly be harder than maintaining
>     standalone famfs?

Testing is a key point.  Famfs needs special hardware or emulation, so
it's not straightforward to test.  This could be solved by adding a
"dummy" mode to famfs server that exercises the same fuse API, but
instead of special hardware would just use plain memory.

> (g) Whether a fuse-based approach would make famfs more complex.
>
>     Will the shift to user space result in a significantly more complicated
>     overall solution that must be maintained?

The server would be somewhat more complex, since it's now implementing
things like pathname lookup, etc.  But the other stuff (managing file
maps) should be very similar.

> (h) Who would help drive the fuse approach?
>
>     Fuse people seem to be willing to help, but I expect that there must be a
>     close cooperation with John to make this fly. I don't expect that John
>     himself can easily (or understandably wants to :) ) do the heavy fuse
>     lifting.

Yes, this is where previous efforts seem to have gone off the rails.
So I agree to take responsibility for implementing the kernel side and
help with the server side on the condition that John has trust in
this.   I'm not promising -7.4, but can at least try.

Without John's trust I'm not taking this on.

> (i) Who would maintain any famfs fuse extensions and own any bugs?
>
>     famfs will possibly depend on fuse extensions that might initially only be
>     used by famfs. Would the fuse maintainers just naturally deal with that?

I can take responsibility for the fuse kernel bits.

> (j) Whether a fuse-based approach has an end in sight.
>
>     famfs goes back .... quite a long time. It would be nice to close that
>     chapter :)
>
>     Is there an end in sight, or could we end up in the same situation in 6m/1y/
>     ...
>
>     IOW, is there a way to agree on an MVP that won't require a lot of further
>     re-planning and changes to a fuse-based design?

I already sent patches to implement the dax dev mapping, and the
striping.  We've discussed adding support for fixed backing ID, which
was something that John asked for.  The only missing piece was adding
a protocol extension to set up  simple extent mappings, which already
existed in the famfs_fuse patch, just needed to be renamed and unused
fields changed to "spare".

We (Amir, Joanne, me) explained to John how this is exactly what's
needed to make famfs work.  We've not seen an acceptance of that yet.

From my PoV this would be extra work, but in the longer term would
expect to be less overall maintenance work and fuse would gain some
useful features in the process.

Thanks,
Miklos
