Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94204360EF0
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 06:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748097; cv=pass; b=rDnVqT9oFJN5KJvZAWGlBcO/G+agp0IDO5Aw+hS1c9/fjv4MqwXurmYUlO7Nv4/GZraVmHgXUngmkFB6t/HpxvTJNk6Fw6h2OvRrSNzlSMRSGMtTlDp1gA06OsOMW5Zq4JLDs+QtLfdMGYqrF1uBDCsZijpILPLsA6sqpF3SrK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748097; c=relaxed/simple;
	bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDuzCG5BTBDKRPkBfx+jyL2+0zE3t7TI/7SqHWx+S12NmSmXXnXGhv3bpPE1YJCQ2VWlhLEjOwBL5Q9Vc5g+xcGe8voEEv8g2h9/TFf7BwDdxtNEh020etIVIOVuIopmv0HoGZHrxB13o9enYp8phP7R5mAciIX33TIqf6CyfTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbkbRpbf; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbkbRpbf"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so6793228a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 23:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790748094; cv=none;
        d=google.com; s=arc-20260327;
        b=N9qfJIu5QkaQPfNSQTyRkwyw0vG9kzVrvmvjxtl0L8Si8xJn7jl5bgGBX8wurp8Rdw
         /nkFSPnwYeuFqNCYC1I96T/uSh4EG7ApZCas/M79ruAHOwmizrsOFJq/3d9LJEdNXMNq
         tcm3JwtRmRMTtzVVvOnjiABQytb2CW/MRCbwwhYdbjtjbCJQNCUL3Z0nISTRht9SurNZ
         kWvfQvJzusc2SZ5rDAGYqYgrKgoc0n4BwN6rN2pmsxUj1vYWugQfLj9SLJJ39unQS0hh
         xzeCOIWyJVsIRdPYhNCbjIhUvCdsbcwHr2vQyGHtLKPh22RTGA6PQpziXPgrN9jutWFw
         BiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        fh=LwE8ulRo1s80Nte4tXXt2zoj5u3ihtZ6VHt/BfysXiY=;
        b=YVhBqJ8jPvrtOObkRQ1KRfkv2YM2Ij2F9v/c0eaD5KQ2RffFP6zFB3Z8T+gQ4Kj37f
         LxVRFXAvFzYFR3vgGZsClpQ7R0uBwlUXCT0xc9sTonXK/NHlODikJIkYoodjka+bbKWt
         OnRuCVGHoGkytCB2V81RIw/dAAvMlnUc9RPrLfcF+WpKacowx+0v6AYDK2JVTzEldQ4f
         xvjcxI6Xq34ntqVhk5G1euVoIu4RAEHrMgjPVx7fX84YpOiiuHXgginQ4O/FnchHcNMD
         oUbxio7V7VSAGGvgh1K9LKj/kyjSjyShgtYssTdiEjLzMnkt0GH7HJfH8KVsc+sGi1uP
         q1AQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790748094; x=1791352894; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        b=dbkbRpbfKdC72JSlEOL26WJ0C3552uAzx2un67wAa8DxIHxRF5DQyFsbjrXW95P6rm
         Ah8r+ACFprTup+ZCqS8Ty99wjIwpLK8uj4xYQNKF185ozMSwR5u8EJWS7m8X9JYxpVbk
         Ef5xpRRTpQ1OD/2YZBCJGbUFBVoSFRA4BU7TN0B0wwYKKadwA6v1e/U/V1ZcI80duAPh
         EoaGbp7DG7VAJoxvriD1jiwi3bbsRclRlJCTS6NjjS+RITbX5mfkcmDHIQNWb1FbiV3X
         rUli9Ifsfy1GZ7d6Gvbwb/1dO4bvBYEiCkUc9/joclV8Krbre6XP3TOm3TK664fEOT2A
         m3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748094; x=1791352894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcOj33yDRHvyt5L9JitZ1ZGchB+/DNq2PYiHYhA9vDY=;
        b=QOnslZsHbPF9bGoOynu0xZMTVNNKuLBNFJ+EhoocwJ/GsfL8kS0qRB9TVC4l4kTMAQ
         xVwqS90/w4Va7fPv68OfMnxvJzFZxid9TuHH6bf44Xv8Ha+QVMab1GPfe31bEWUXOaeN
         y597mkaoNGBpG6YyLubTEb32szWjKEbIDtMJtIzKG/74NvgH1vD0zYU41B+mQMwtPqcA
         86gzXBhBza1j0Mnj+V4zL3qiRk1NFcrp4D457gwLh86PPsUABpo6kWHPI58ra4AfSOWC
         FmAwy7gTcL9TreaMVo2QoAjpztRsG8M9prwVzndU8+qYMwvg/G++NMvt/j0L1xUY70uH
         +HSQ==
X-Forwarded-Encrypted: i=1; AKwUvByquGfmgBpTzwc5GqK0zQWGQ95ToBuuu1RLMnnNxMv6Di/3G1uMCkh8v+jVO/y7rSmslsJkJTErd5Xo@lists.linux.dev
X-Gm-Message-State: AFq9FYKZztroDBnFoXKLmYaYqcPBqLb63tAdCY5Fw7cBDRjkoX8i5Azl
	wrQ2+k0qPNqI6ZqtnXhRu+8QzGhfIh7joxOh/N5kin0hagxkcCYL3oV6OeMS+v/amD0EvGvA9KE
	fWZgqPjTyo4fBNBgd0j8osIdn5a7Xwyg=
X-Gm-Gg: AYBFou3NmmCI3IOs0HcHiDhx42B6sEnc46VDBI9KqmJcue8vCuMnkyrmPqphqh1F20f
	2F26dKlyXO0WRf+X2qn/IOktRRLNCMDbItjZRc6cs03qMT4SN6UlQyiLqh6OYoRy87TZwpuAm//
	C3l1LG1/BLMK9CRkPwI4XgHTy3qO+++MN4dVBOe0NYeqltqcnEaL1Eiu/lhBOyRRV3jyboMYZd1
	IHc2biJ2RYnAbAFho4ywtpe8uac6ayzegjw5691QbIXlkltBp5CLBpD/pqZJ/gYCcSB4u3MOYkc
	04/cT1I/R3gxohe+/jns29M1wEUOA/ntwsIrnhwfCIb4ANHky002Oz+ZEv92l/WrW4c=
X-Received: by 2002:a05:6402:240d:b0:6aa:b341:3f9a with SMTP id
 4fb4d7f45d1cf-6ae199552c3mr84751a12.39.1790748093339; Tue, 29 Sep 2026
 23:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
 <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
 <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
 <CAOQ4uxj4xQ9Z=9JH=U21iHnfLBQLboz5dsivigKicWS22M+zgQ@mail.gmail.com> <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
In-Reply-To: <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 30 Sep 2026 08:01:21 +0200
X-Gm-Features: AclHuK-4L2-xB50QQpUyCJRdrgV6J6jaFhZT4eTld-X9LxMW38Hfe-Cy2gWP4SU
Message-ID: <CAOQ4uxiw-=keqrbFsPSAz6USCbHe1EtpjnGCLsRe2zXsXMeEog@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Russell Harmon <russ@har.mn>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:55=E2=80=AFPM Russell Harmon <russ@har.mn> wrote=
:
>
> On Mon, Sep 28, 2026 at 9:54=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Mon, Sep 28, 2026 at 6:04=E2=80=AFPM Russell Harmon <russ@har.mn> wr=
ote:
> > >
...

> > >
> > > If I remember correctly, name_to_handle_at on a FUSE filesystem
> > > contains just the inode+generation, and open_by_handle_at results in =
a
> > > LOOKUP of that inode (and now inode+generation). But I'll
> > > double-check. Assuming my memory is correct, I think that's
> > > sufficient, assuming that we consider inode+generation as a unique
> > > file object identifier.
> >
> > The problem is, that what you assume is not an API definition, this is
> > a specific
> > filesystem implementation, which happens to be correct for some commonl=
y
> > used filesystems (e.g. ext4, xfs), but is not true in general.
> > In general the API {name_to,open_by}_handle_at() the file handle is an
> > opaque blob.
>
> Maybe I'm thinking about this backwards, but we're not talking about
> "any" filesystem here. We're talking about the FUSE filesystem where
> the definition of a handle _is_ inode+generation. All I'm proposing we
> do is to expose that fact to the FUSE userspace daemon.

Correction.
The generation is exposed to userspace daemon and to the kernel
via the LOOKUP response.
All your patch does is re-validate generation in GETATTR/SETATTR.
Practically this means that generation is validated on attr expiration
time. This is a reinforcement of an incomplete id model, but it is a bandai=
d
not a cure.
I fail to see the real world value in this change, so please do explain it =
to me
in terms of use cases that would be improved and by how much.

> That daemon
> can then turn around and call open on another filesystem, or make a
> network call to AWS or whatever. In my case I want to
> open_by_handle_at on an underlying filesystem, but I can solve that by
> storing a mapping from fuse_ino+fuse_generation_num to
> underlying_fs_file_handle in my database.
>

Exactly! The daemon does not need any changes to FUSE protocol
to have a perfectly correct implementation.

If you can demonstrate or envision a filesystem that would benefit
from your patch please describe it in your proposal.

Thanks,
Amir.
