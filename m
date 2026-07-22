Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93E3546EB
	for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728762; cv=pass; b=LYYOdwiUztslhh5doWuUuq5f6OZv1sqLRxi+XgKu9Io2zR5NE4WtPuJXIxZ67dWAK4TKLpcvsCC+GHJxudQRnKb4smXe2St3DHulZW80iF/6HtsJlZQaBxi8RhL3P2hRhwFOdRUpw4qDb/yNtlOrnOZQ6XXYgmaCeQTPpz73q1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728762; c=relaxed/simple;
	bh=l8OyTHPsSiXlV3Gjth/iDTYvVrHiTPTknws/b6slKyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnRl9kcNORpZn+chhP48/vwP29Onqs9j6dvXard9Lvn83XYe6IKbzm0c9UvadW6F4mmNJlVaKZwjSwGz1X6NqdC5Vi12KdqToJAgkhy7LKh0lOZBSXt2QXW2wQr9omzL0k4S3beM1NXil2PKGlbJdg6JXI317ceuBvJBCLA0o5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=QNPYoH/f; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="QNPYoH/f"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c21495722so88889141cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 06:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784728758; cv=none;
        d=google.com; s=arc-20260327;
        b=mYdRX6Zt665kvplzdlMTNLXuKZkTwRqBcAxc60dNZBbH+kMCbv4MavS4LXyJRrHms0
         PfZ1hCzmAX5+okCh9v4hrqGoFmzvyJUHJ2P98T86MwDvuNcdg0r4xndAQYwfbTAbylGv
         J3/D7Yb8PaE4hGSk+OaLLa8K7otZ2Pv+rsA0o0FmZN5wz0AQnZB2DdDQjkNSOF7OQZHH
         9zBnJWRreZ64+QRoruDjXscgZMbMu1lRQ5jXWKFtBKkWp0UyZL4stQEssgdHP39CWyih
         r7aMErfbd3THwYH1n3TXPll+/mKNm3ZoCQ65QvB9XOZhkkKc8NnWRV/ORPleW++m/bi7
         cWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vQ2/EjZAmPdGp5icD1VFPQXMQudnf/IhCWBft3t6T2U=;
        fh=qsTnZmLrgMhxNe1wew2xZixyyfJPxcEt1dtAESZd92M=;
        b=GoQiXAE4H/2fNOdOgB7LDjteEve3I3IjmLb+nwEL4xw137EF4/taviUcVwvuaQtiD1
         OiKXz+9lMixRJyuVXRwQFPglvEWQOXRKFBjAuX/2DPcp7Jp0bvy7EVYuNAzPoO5WtLsw
         nqBnenmEALBCPhFS5glz17Gy5tIBbFKsUBRfqyc2MHfF2TiemF99yvqTt3MfJ+19Wnct
         1CweZ3WiOUs6hfQBMHk9c/+dXbufJA5KORoyNpDrrw6RqvuIyQzZrwUB0AjQOSGJ3Dai
         AmheRVPVRmBxg36VBVAq/LwyJDmBUyWOciEUODQHPCmZAICEATduq3kFhlWCl3hngr5y
         wC2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784728758; x=1785333558; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQ2/EjZAmPdGp5icD1VFPQXMQudnf/IhCWBft3t6T2U=;
        b=QNPYoH/fA8AVDnLfViOAibASjhUxG237JAaJ9Bia122HDFl8bQO9qb9dbvVrDzV87B
         BpE/PbDb+7NhyPx+yliG+IEBVKkATy5jcKI9/qu0/ga4tgQvkqRZ4e8X2QrQnR+8+GRh
         B5R/jLONk3Rzha6mvpxgEvgIviT0ufCs9jdVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728758; x=1785333558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vQ2/EjZAmPdGp5icD1VFPQXMQudnf/IhCWBft3t6T2U=;
        b=C2NxL5W0VNfPS+/f1ETQE2oFxQ+GY4DE/ssUkLhbj718afawGCmALPYbwQ6HnsGumY
         TgjrHvYafS6UslUMo7bkciE2wwJDhS4MzHBfHYqUuM4Z+V6jv/ddLLAzYl2js0i9XXAl
         uEC550/NLmkyLm++WFjP3/9b6lg7vq7vWv5+5++/hWI/2GKGXV7gJ4Tim+GbGOJ073oI
         rJQ4HqzefjgRFIU/KiyFUJuTQ0gvDVSAGiIBApgh//XeyXbG6tZJLaOWQhRuO9AyIcH7
         wqEm/nm37eFXWSrVMr9NIoul+/r30IqcrRx7zYn5NfRemzZglQBrIf1XfJ91J3GF1GZW
         8W7A==
X-Forwarded-Encrypted: i=1; AHgh+RrlisOQFwry5jctt+mhnMl1qNxibTjiJM4roTtTkOq6Zb+lh1Bdlv6heJZSd8MzoDgibyP5nlIu69hR@lists.linux.dev
X-Gm-Message-State: AOJu0YzXDkL9BhmctfFqMW+g+gwC2K/jcJ89LICc8EGr0ePIu2JQWKHn
	HysHQidQOUZc64KD4+aMvc85IRQW5LTLpX2sAHvnef1F/wTmuv30NEgDfV2PUxcSHdeMBo0Mv2c
	zS/ko+nrgHficaNQE+u33ALoR5qJe+qzCvtIsTilllA==
X-Gm-Gg: AR+sD13HdYnOfIASpXVrc0E9RSPNVOrRLm/ek9wXBSQmA9UHGa/fJm+Xfr8PFSGNbNR
	Zd7rxtkbPbcnv037TOgSO1rkjH9krDbiRJIKmeo8c8Cwm2zpfyRCQ8vC5wqkejjXwLkWJx69hQs
	X/GckqwmV4SbH4Pii2DK2Dl0Yd2+pPvOMDSkezm5lY+wDD0VbGskgSBn/9v2w7l3+8RuBvSq4nV
	tkx/Rf/v8PWCnlotpsb8wDHiN2F3fTWGRro0VTAarDIjvZmdzPsEvqRGkV8xgWDY2ohFe4yHbEg
	c5ehBeByiHQzAGUuag==
X-Received: by 2002:ac8:5893:0:b0:51c:7b13:62f8 with SMTP id
 d75a77b69052e-5213eb800b4mr216533471cf.78.1784728758165; Wed, 22 Jul 2026
 06:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034541.68781-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <0100019f7da14ceb-fbd4edd7-ce17-4770-8c58-1296ad3e3fbe-000000@email.amazonses.com>
In-Reply-To: <0100019f7da14ceb-fbd4edd7-ce17-4770-8c58-1296ad3e3fbe-000000@email.amazonses.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 Jul 2026 15:59:07 +0200
X-Gm-Features: AUfX_mySW2J0tjX47cdgUqD8gQ_vf8pqX8_96NOWv8ZzqlVpdTk8edwifSp98Qg
Message-ID: <CAJfpeguf3EBgBrf=mrG2Jp=oNp65DDg1fZsdEaqgBn6UNNrZRg@mail.gmail.com>
Subject: Re: [PATCH V11 3/9] famfs_fuse: Plumb the GET_FMAP message/response
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, James Morse <james.morse@arm.com>, 
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

On Mon, 20 Jul 2026 at 05:45, John Groves <john@jagalactic.com> wrote:

> +       /*
> +        * The fmap size is not known in advance. Start with a modest buffer and,
> +        * if the server reports (via the returned header's fmap_size) that the
> +        * whole fmap did not fit, reallocate exactly that size and retry once.
> +        * The server learns our buffer size from the request's
> +        * fuse_getxattr_in.size (GETXATTR-style size probe).

No need to retry.  I'll post a patch to dynamically allocate the reply
buffer (already posted as part of fusex).

> +        */
> +       for (attempt = 0; ; attempt++) {
> +               struct fuse_getxattr_in in = { .size = bufsize };
> +               struct fuse_famfs_fmap_header *fmh;

This struct isn't defined until the next patch.

Thanks,
Miklos
