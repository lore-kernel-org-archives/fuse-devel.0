Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0A036826B
	for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731392; cv=pass; b=r2xE5vYFawMTvOQ848CBz6irrXOuMxaxF3ZZt2y6b5a4n/V99JNX0/j4OuBM1Z0DZIWrKv8rmvl55KN9+d6fMYJn/3GwqwfLHue06lQb/iShnEztjb0TFe+Libf9xmD+69ralAcDrLEj106uJH1Y28jGQP2+4QJZN3Qo+eq+pqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731392; c=relaxed/simple;
	bh=ahrPeW46a3z7uaEO1zJL6eWoGd4K9B9MS3EeUm2ySI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVwbl0AFJ+3Rb4V33nUTLOxPWJqcwASJLvvws5ujjGVDVrL/ltVb7BWKa7qezKSPrRntxzEs5NrkjOMBi+xCCcOnmtW56RnEGRpQZOTYXaIFbutXBPQYmRznPsHIKuotf5oSwDDrhoPmNEpdpWHInviSqXinHs571OweOFclg/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj2GP5kn; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj2GP5kn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de008b020so4683667f8f.1
        for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 07:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784731387; cv=none;
        d=google.com; s=arc-20260327;
        b=kCUk6DyFJnG/OTiY0KDvLe/fR4kUbay4uan1nMKWv4ipA4dfC2yDjSZcmkvEwNqT5d
         skcrfW++9/bO8Pm5B/S9EHoYrg5dz/QSYQSLp10T7N1Q2iwOhx1Py+oMJyVdbJQ1khOI
         TMN8Vpv1MYy67IksYVu64z0CmeKn3hSNKyZdbmuvXA8BwKiY0LiECrKYLHtByqO3Fkai
         2ixZcHuj3DpWhiHkfMZgURk3noDOSb/geD6VEZhmV2b0nAaNEsYz22oRld/N3QPOkJwM
         oK7V6vHMQW8GVjMLzHDpjLAoXL3jC0I4/L+Z6hnjXHdFeIp18ieJ1RGf01HMVLl0BTYy
         h9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbVVn3kwJvwjtX0fZqdUSffXklqAZ5aOd6f3vVAXXIo=;
        fh=hXiXOC8IG/4v7Fxq40rXZhaENazJuBQWZWEqMjst4FU=;
        b=qp2eHUFev/nBRGJfxfmq8MzujtVYkcTWN89DrYMk+yKxQBishiRzLS71j9WMy0PVbe
         WYjmHJoQ2LjZ733GJuobirnUv5w4llkUdojid4Pu0F9CarUiBxbiChDpEsst/4gjPYEc
         1SKAjfxi6u+0kYshFfFJeEfV5wV9pRkgZWrCgwYgw8/xj2Nk7TgD2R+wZvqn+4dNHhD9
         I0hq1O8oWllxPPQHKPX+Js42a7B7bXY+HeY/odFTGlf0TqpYzfxtZGDKQYSZIHD+0doQ
         5N3YHP6NEIR101ZE6iHcCRqzdIqWMsl6SKE7Q2WsGQmOnzZ5nELNBPj1PWYw5FMjA/S1
         EcJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784731387; x=1785336187; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbVVn3kwJvwjtX0fZqdUSffXklqAZ5aOd6f3vVAXXIo=;
        b=bj2GP5knKSdyTKHAhnL42Tlw5FT8euu/COJfXkBJoHMlxQq1X6L3skcXu0msuNi48F
         LCBItv2ghG9ns53EidaTibSBthAn4K63pmdkkkyOXvA6KRtQ1ITrrsX46jgpaV36LgKv
         xfFZI6be8fYPqPhyrUmAVhRlob/V1VI8wofwXvcASBwTEf8mHcjPnQsCXwxfAD3KGdA5
         7hqgH+IXyfX48t4cgfGVggKG20dNbYpLBqLDQRiSuwW3jrfTiQe8WxNq6FqOEt4sesaL
         94K7BxOL166oLzqJDuW8LfTJYMEioyMf1qRty6VXnCuUZaZhntIA7aFaSUTu8v6xrbo/
         pTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731387; x=1785336187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbVVn3kwJvwjtX0fZqdUSffXklqAZ5aOd6f3vVAXXIo=;
        b=U4hvETnhfEb4hhCeqFjdYCREKA0VnltOIZ1qtn2j+CTFaQyKs4DnPMdoI0bUsm2VXG
         EuXnBpRvAZYGSGDqK70FU3HKnbiDztlvuoRytAfYLNRlcRmot4Oab3corTFp+R7wPy5X
         FDPtUWQ59SRVBzdPip3so/1fYmmQJ/+KWxw5I8Y538AZ4gUmzBAtv6BWn928laCvGdos
         Zqo0gAu5Dw74kCqn9mlcJqyWP1i8gQNxTIchNTnwVMfaTUFbj7jaAOtUkhy+ox+SVi5j
         vsF1XO9hDtBx4iMbHkF8/LzwXZHVC1Umm3tisDQ4xPdte9QnMXxVDtgLbGvmhlTVG5W5
         ZFJg==
X-Forwarded-Encrypted: i=1; AHgh+RpKDRpHvwPtuY5pAZLCviph6BKzBsYe/nQuoBbOiKYApv7Y1w2BCLw38j1kvizvqOh+wD270llD1BOb@lists.linux.dev
X-Gm-Message-State: AOJu0YzHfwBZrM/HI3z2AIoSbX+V4B9XsPJzF1DP2O+dZ6Mzj0V3FxKZ
	unoPrn7jTphthgfBt7WGaxwS4mM6mtPj/k5jaBg4bhnB3cfa5i5WH2fwarYVMogdRC0bkoHldxL
	jiUCBhcuzCShfdRJnKfaXoyS2+x9CV14=
X-Gm-Gg: AR+sD11QREUhs3kiDvp8vAyvuDF315F1GaleKn/63HOhY3OMfLtFwk4xHg6AQSzn1K3
	TGITaxvSUj3ztcX7IDzpzSrn1H9qMvaLJT6HiDBY9SWAmXznY7EVREHGKEEg6jykwj3JVog0eXs
	PJ8aI+s4T25mn9sxg4+FZjdmSUBM4le65R8YW9+/tz1nngrcPaOveh98XfOf5NbJtQxTw3cd8Mh
	NAMMB9rOcFs6U7/VMJzsHi1E9BQ3GbNXRhKBNuV2ElWaKMtVVQEH3A7Bvb7whOm/X9kXk21VshL
	SjbBXKtz2lovWrbcA/ydP289LuHU9C7+vXk3fvDhrA==
X-Received: by 2002:a05:6000:2a0f:b0:47f:6d9b:f204 with SMTP id
 ffacd0b85a97d-47f840d1199mr3725320f8f.23.1784731386878; Wed, 22 Jul 2026
 07:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com> <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Jul 2026 07:42:52 -0700
X-Gm-Features: AUfX_mwxuEB8MpcAvVdcxrfmXjtIkJPDlLRoLVxYiUNlL8we5MhuKUq5tNA-EIo
Message-ID: <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 5:47=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Wed, Jul 22, 2026 at 12:47=E2=80=AFPM Miklos Szeredi <miklos@szeredi.h=
u> wrote:
> >
> > On Mon, 20 Jul 2026 at 12:07, Amir Goldstein <amir73il@gmail.com> wrote=
:
> >
> > > It's not about this ioctl, it's about infrastructure reuse.
> > > It's about the fact that there is NOTHING special about dax_devlist;
> > > and no reason not to manage it via backing_files_map.
> > >
> > > The reason you stated was that you want userspace to determine the
> > > daxdev_index/backing_id - fine, no problem - this is why I asked that
> > > you pass it the desired backing_id in the ioctl.
> > > In fact I think that all fuse backing_ids would be better assigned by=
 user space
> > > so the extension of padding =3D> backing_id is not unique to famfs.
> >
> > Right, so I suggest to just reuse FUSE_DEV_IOC_BACKING_OPEN and add
> > two flags: one to enable user supplied backing ID and the other to
> > indicate that fd refers to DAX device.  The changes to do compared to
> > the current patchset are quite minimal.
> >
> > > And the best part is that this request requires no changes to your us=
erspace.
> > > You already bite the bullet and maintain the new/old uapi but changin=
g the
> > > kernel implementation does not require this burden from you, so to be=
 honest
> > > I really don't understand why you did not follow Miklos' suggestion.
> >
> > Code reuse is also important, but I understand John's position to want
> > to separate famfs from existing codebase as much as possible.  And
> > because this is an implementation detail I don't want to make this a
> > show stopper.  We can easily fix it later.
> >
> > > > - Lose the famfs interleaved extent format. I have complied with th=
is request.
> > > >   It makes some things worse, but we'll discuss that later.
> > > >
> > >
> > > I am really not aware of a request to lose the interleaved extent for=
mat.
> > > How can this patch [2] from Miklos which reimplements this format as =
a generic
> > > uapi be mistaken for a request to lose this format?
> >
> > Let's not care.  We can easily add this later if famfs (or any other
> > use case) decides to want this after all.
> >
> > Making the initial patchset smaller is win in any case.
> >
> > > Let me recap the former review requests as I understand them:
> > >
> > > 1. Use ioctl instead of GET_DAXDEV
> >
> > This is done, just need to reuse the existing ioctl instead of add a
> > new one with the same semantics (okay not true because of the fixed
> > backing ID extension...)
> >
> > > 2. Use backing files infra for daxdev table
> >
> > Leave this later.
> >
> > > 3. Use ioctl instead of GET_FMAP
> >
> > Not sure we agreed to use an ioctl for extent mapping.   What we did
> > agree on was to use a generic interface that doesn't have anything
> > famfs specific in it.
>
> My bad. I thought that FUSE_DEV_IOC_STRIPE_OPEN was an
> example of how GET_FMAP should be made into a generic interface.

I had the same impression as Amir. The FUSE_DEV_IOC_STRIPE_OPEN patch
[1] right now is only for the interleaved case to handle striping, but
imo it seems a lot cleaner to make FUSE_DEV_IOC_STRIPE_OPEN a generic
interface for handling any backing layout that corresponds to a
backing id, and having the simple extent case go through this same
infrastructure / path. Especially since John's future patches for
adding the interleaving will go through the ioctl, it seems nicer
server-side as well for famfs to have one consolidated path instead of
needing two totally different ones. I think also file passthrough will
want this infrastructure in the future too, and their use case would
be mostly non-striped extents.

I was imagining something like:

struct fuse_backing_member {
    uint32_t backing_id;
    uint32_t reserved;
    uint64_t offset;
    uint64_t length;
};

struct fuse_backing_layout {
    uint16_t nr_members;
    uint16_t reserved1;
    uint32_t reserved2;
    uint64_t chunk_size;
    uint64_t flags;

    struct fuse_backing_member members[] __counted_by(nr_members);
};

which is the same as what was in the FUSE_DEV_IOC_STRIPE_OPEN patch
but just renamed and a uint64_t flags and uint64_t length field added.

This would let us eliminate GET_FMAP, which imo needs to be
eliminated. The ioctl also gives famfs more flexibility with being
able to preload extent mappings outside of the hot path instead of
being forced to only upload it on opens.

If not the ioctl, what did you have in mind for a generic interface? I
think anything else would have to keep GET_FMAP, but maybe I'm wrong
here.

I think John has patiently endured a lot of demands in the last 2
years, so I agree that anything that isn't uapi-dependent should just
be done in the future as follow-up work and shouldn't block this
series. imo the ideal version of this series would have nothing famfs
specific in it, but I think a lot of that can be renamed /
restructured internally later on. But the extent uploading / GET_FMAP
part seems like the last thing needed to figure out.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260601152327.2069787-1-mszeredi=
@redhat.com/#t
