Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797283EAC6D
	for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787695735; cv=none; b=J+p7XfyvY+mbiiDYQtJyE9+MRw5vXgLxS9GCernFm5ZVEAKKVFa6C+0XAJggvg9p5GMaxoKXAwc2q8njj71TlgTD9zf58NWCFfspDY0ckk3pRMwRLtfuWav4pNX/QeOo2f1U25OCWgfLIyEujV7CyZxfLRJMypAS1eLT84KQkUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787695735; c=relaxed/simple;
	bh=ALvTtQS/ZvvUR9gxm8qmzRxg51/e/os61XAFTpQzc/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwvOoD3RGEqJMCL02crDfO3oKaQUzToBZi6WdCLaVoraJnBMlizcjgG+9s7mujK8QdlCNWVv0UVTbfftj47ilptGMOnlHcSt7xLlLMWA9vHMJBg20hUm+jY3ds1f/0MVs/nUmfn16HrAYEtTzvzSG98ooHHSJFsXgzixvwT5Up0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so343866a34.2
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 15:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787695733; x=1788300533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALvTtQS/ZvvUR9gxm8qmzRxg51/e/os61XAFTpQzc/U=;
        b=W+zAQMYsKDA8/eWFc1fS/sDNO4AS96Yxbi397rOwBTf7ryBqOgWDsnTTWCj/boH+7f
         Uth70ku8Q3vje4c7roEa6oMxBidyQJBSlPXc7oM59SN0Exo8528w/G4SorBCuHvDcn/h
         0N5iYHFzw0xmtikENZhwoQdFeW+D7yk4zKqcZSXJBJFbpTGvtVxJYfDZZqU6/FXsYvxa
         9mZg/kOkjwAhSHrrT+S7U1HCu4prBpisbZY2tDWfNYzZJIwMyV4ojlAoS7QPHiZWfNTV
         aS9kPwocTZKvZpVHmoePoVIgNvAa57+P/02or15YBnceYEW+GSSLC57Ws1yLBF8KbLdT
         FBHw==
X-Forwarded-Encrypted: i=1; AHgh+Rp79dz/cYFh7E9OtjYG4s0Lf/LyKuxbYJFDJ7n/pvmoXUmIxhOhG/1BX0C36eEAzkmrXuKuvOMmC2QL@lists.linux.dev
X-Gm-Message-State: AFuF++m6uNpBLvrf3YoOiWvhaNSbcISgSdkVrTPZIsebVssOC57TiLMf
	qcFAHkuYrtA75elm3L+KFXFeq0+jj6c3e3AwfMeBTeBJL/ncyoUp8rIv99U/ybw+
X-Gm-Gg: AR+sD105S3jQNV3QpF/IQxRODtZe/IXZqKwKkLgsFFwGdTXWPViXjgutOyb/QFbnqTL
	4+TYwbt2GtJglZZTnhwKaQKXknU6hBEkEOblxRfa7Ei+cJgk3S6Dq43Dh8dv5iI/5QP6OFQtmMF
	XVboNywOJ0PFUz3FEZ36+BvLibYdf0IDTAWkNmM5spv/Q+N0C05GQ1XdMDzEE/KYUCqa2Unb95H
	HXJcm3IjBWKeRgcbE7CUwPjgofiPDPpr9zdscd/4udWHD86vb140v+pSIu/9q/m+TS9Qw5QXFJ/
	iqTTpdQXdfEBinvXy9Dccjs4G7y2YCGXpJJ4Xd+puY9dspE36Uh+dzemPLO8/GBjHyZ8D80sjEL
	1hQtdOUGG25L4fD5WjQGnbN1q7Kr1++xbHQsVzAdv3in0aocXWB3DdNpzlTNU/ZqocTWb9NE5Ja
	C0xCbtN+RdkYivnn5hoJdfbGHLz/ROPzLEc3uV6rYVxC+PwpNnxWHS47vOwoPGfq8sgtoEp7DZe
	rDKB4t9QZqE/OYVkMeI0PA0W08Ij2iNTPcTHUO27y2587ay4/tNv24puZSegExKnrqwuDV5dYmr
	sk4jShXVB2aW9rs/is9+D0rsjU7cT9McbZw=
X-Received: by 2002:a05:6830:6687:b0:7df:5fc:3fd5 with SMTP id 46e09a7af769-7f4c4dd1f54mr2502110a34.1.1787695733210;
        Tue, 25 Aug 2026 15:08:53 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c8410090sm119535a34.19.2026.08.25.15.08.51
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 15:08:52 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso297817a34.1
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 15:08:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrCI3epD5C+5dXvUto2IhWpMkBuW+gfODxJ34BQPNGJzPYvbJg6OoqxC2DyhNxW/dKonuOuaajmJ9FR@lists.linux.dev
X-Received: by 2002:a05:6830:7104:b0:7f1:ddf1:c731 with SMTP id
 46e09a7af769-7f4c5097628mr2648400a34.13.1787695731676; Tue, 25 Aug 2026
 15:08:51 -0700 (PDT)
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
 <CAJfpegsC-D0AJij3E=dbKzZCH0nijE7+rpPut-EnRd3r0uCMtg@mail.gmail.com>
 <20260822002111.GA6110@frogsfrogsfrogs> <20260825-hinab-kanarienvogel-mitschnitt-04a662533a24@brauner>
In-Reply-To: <20260825-hinab-kanarienvogel-mitschnitt-04a662533a24@brauner>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 25 Aug 2026 18:08:14 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8d0kKH=kPiG7RDK4jGiTvECyOA_uFkZzbuvDpR+owJEA@mail.gmail.com>
X-Gm-Features: AcwNN1Ug6ZjMUQh0-6_7H39nZVAq6SWCLa31cOPu7pwraCiDoCVhUYh7Q1UxHT4
Message-ID: <CAEg-Je8d0kKH=kPiG7RDK4jGiTvECyOA_uFkZzbuvDpR+owJEA@mail.gmail.com>
Subject: Re: [PATCH V12 02/12] famfs: Module operations, fs_context, and mount
To: Christian Brauner <brauner@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, John Groves <john@jagalactic.com>, John Groves <John@groves.net>, 
	Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 9:44=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> > > Without John's trust I'm not taking this on.
> >
> > Whatever path you and John decide on, I would very much like to see the
> > question of Which famfs driver do we merge? to be resolved for 7.4.
>
> While it is reasonable to place limits on how long a series is pushed
> out (I like to move with some speed myself.) we have two competing
> implementations and that will have to play out. We should not merge an
> fs just to finally merge _something_. The fact that this was more
> contentious than usual doesn't imply we need to merge a version, doesn't
> matter which one it is. That's a bad reason.
>

Well, after 12 iterations in this version alone (working on this for
three years) and forcing multiple side quests on John, I think it's
not very fair to him to keep stringing him along like this.

At this point, I find it hard to believe there's much more to discuss
about a not-a-filesystem that is relatively isolated from the rest of
us. I've been following this discussion and while I don't necessarily
grok everything, I understand it well enough to know that someone
should just shepherd it through with John and just work things out in
post. Honestly, the amount of metaphorical heartburn that must have
been generated by this is insane. If I had any say worth a damn, I'd
say let's just have Darrick work with John to close it out and get it
landed for 7.4.

Ultimately, the question of which famfs should be merged should be
decided by John and Darrick (presuming we just all let Darrick
shepherd this through). This has gone on way too long, I'm getting
echoes of the sched_ext mess... :/


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
