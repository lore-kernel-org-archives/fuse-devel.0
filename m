Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA53ED5DE
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100367; cv=none; b=uURh9bXTFoOsKjTZcE/KvXFFcVbt+mLAU3oEP9iX2PzXOz7B9WRITefxTsQMTxzn5pNLi7BKY9ba80C964skAfKy3gXmAB63qLokWQvhH+gVz4nYzk95zO81qNEjZTvc0MRoU+Gx7KzCMyTqGvrDsJl+g+JWw8rdXXW83i5L92w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100367; c=relaxed/simple;
	bh=m9+vZFxcuGPYWJBP3wktaN7W2WK4EAv2F55wBzi2Ppk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL3/RmfyXKfzyzD+OXlFRjohpmBrUDiQ/X4IV/hC5LF3HzEgq9B54j9ajShrAYEN+DRi7HFBGHku2KwNnOzZ4BFxxVPSwzqAGi1L6jlf6TcEn63aMot0wQYQTl+a4oKCt5V2Ut6uud6fSl3g/ZKdfbL2xbJPRcxonL6dzy8Y9LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj1BFhYe; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj1BFhYe"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f9568e074so512305266b.0
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779100340; x=1779705140; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoNzxGFL2Ujj/KuhI6hgWUIPCWaa3YVWWoq6Rexykog=;
        b=Uj1BFhYemF5qTuk5ysWT5bk+ZSA1qKn5Q4qWi5SNapCJAjfI9MUINQ+zPJ3tjEkNE5
         EnNltEezh3JiRoooAZE8e5nANuVpxzdl4N8Cf/3ESVcgJ99Z+woHFl0hefiiANutUzCb
         YdvTHqY9l4EDRu0hTST560Bvt9k6Y30gjIc9/lKXra3Utcw7lGlT2XtRf8+5/3oejpgd
         KuEd3KoHc5rr3N2BkUKWugp21adjn+FOpm1HK4B0e33PFHS4oc/hNSC98y38FHUFP7Co
         py0o4cejN4Ollt73odmew8eoGlPpAlWv1DLsWFZOZYB1epgCuCHNN0unst24NHSPMXwb
         OGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100340; x=1779705140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoNzxGFL2Ujj/KuhI6hgWUIPCWaa3YVWWoq6Rexykog=;
        b=Is4o0gqM/pdpDvtVo5uDtv0YKVOkcz/Xvwa0RmUtpiDHfF+1ELkHjNeIVLYTQmJH4f
         tK8YZjw/tcf0QJFaE94HT8qHRephrRPXuJ0j0AfGoGRljHo869jPX/QJ0jXUWBjXJjIv
         2+KbHZuC2g/guwpPrzT1Z80Y+t1VysrjpTjHzWo9awZxIvYWS7Yp3fic0KepaLIl3cbP
         ANba5fcXQh+KvDoSfishXudgBe9dToKa8aOvUoIVPINIxVyT04JCMEMwrZAJAPjWPDEX
         FQ6LmxebXz2C/dNQ41aP58gs6p+u45p2XKWeRnZ8iXV0lUwONwYN5a2MaNCiu1EZJ9L2
         St/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8miDso9gZahU2MZXXCgvPJ/OXa/bZgHS+a8qbFS14FXaT4QV/08N5xnqmxJe30GyKFy6HCkX8WXUbV@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/OlwvKhC8nw+Cu/mPt6cNp/59w96Dy639VNI8WMMZC6DMZCSJ
	qJM8WdTgq2sZFhEri/xrpcLfU87eD1SKSBFd1/r6gZ5TM9NmP+9VmKm8
X-Gm-Gg: Acq92OEC8lxKaFRNREE6QRxliR0o5XBg8IP99fwKoCJBSlVQyCdsGRwOqrXg42yi3TW
	WEwJhK3HbxZZHo+BOEd7DKrTNxQCmpv5w7/9IOqSEgnKkOv2eyufN7Ux0L6zxdU00hlQXzgLRee
	sdxiuh7Xg22cDauVJLhZ74y1R+SlXHdN1Q7eyc9O9uFaxn5l+wMgBYy4Zh3sRz1DBWujaYQ4dVL
	Du19F5D9XPltWlpfm4oKraXhbAfSoYxn0T+c00/bordRQLCjzn9VZL/4cnu7KSzwhyAln3b6whT
	mSTTY05Kg9lCHWYb5+dVFjvvTJQz3/AyEgENy8g4r0nu0Buex5DtwyusU1ojejd3PeiaD1P5mSS
	lSgSG5HLB65plUWdiljEpxB9Ig8yxdR3gkVLimFksN1gRE3E001YyvjzX9Yj3RGLGMV7qZWlHXX
	bczo5OY8Ua2f7S/lcJIqCZUtKScMYfHA3cYHlyrNDOmFPYFqux7e+DvDQec+BF14jMuBs+2o941
	oQTNuTTSIyqIOyM26N43lpKpSYitPbgGx7iMmDYsNb1zFDwpxj9LKBIKjA=
X-Received: by 2002:a17:906:4fd2:b0:bcc:e8f:c3a8 with SMTP id a640c23a62f3a-bd51797a61emr744815966b.29.1779100339507;
        Mon, 18 May 2026 03:32:19 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:ec20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ded942sm545073266b.36.2026.05.18.03.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:32:18 -0700 (PDT)
Message-ID: <edcff681-bb4f-491d-b87b-eab5919d0623@gmail.com>
Date: Mon, 18 May 2026 11:32:16 +0100
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fuse: wait for aborted connection before releasing
 last fuse_dev
To: Bernd Schubert <bernd@bsbernd.com>, Bernd Schubert <bschubert@ddn.com>,
 Berkant Koc <me@berkoc.com>, Greg KH <gregkh@linuxfoundation.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Cc: "security@kernel.org" <security@kernel.org>,
 Joanne Koong <joannelkoong@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, fuse-devel <fuse-devel@lists.linux.dev>
References: <20260517095846.fuse-iouring-uaf.dc5f5dbb71dc@berkoc.com>
 <2026051703-equinox-multitude-91e2@gregkh>
 <20260517-fuse-uaf-cover@berkoc.com> <20260517-fuse-uaf-patch2@berkoc.com>
 <08d3f6e0-7745-4084-995a-95ddb77f7f11@ddn.com>
 <9f3f3dc7-1c52-49b6-91d5-046f1fc7b2a8@gmail.com>
 <a44344bb-ad71-41f5-a3c5-81eb99442e5e@bsbernd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <a44344bb-ad71-41f5-a3c5-81eb99442e5e@bsbernd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/26 10:50, Bernd Schubert wrote:

>>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>>> index 5dda7080f4a9..7d9c06654a98 100644
>>>> --- a/fs/fuse/dev.c
>>>> +++ b/fs/fuse/dev.c
>>>> @@ -2566,6 +2566,7 @@ int fuse_dev_release(struct inode *inode, struct file *file)
>>>>                   if (last) {
>>>>                           WARN_ON(fc->iq.fasync != NULL);
>>>>                           fuse_abort_conn(fc);
>>>> +                       fuse_wait_aborted(fc);
>>>>                   }
>>>>                   fuse_conn_put(fc);
>>>>           }
>>>
>>> I might be wrong, but I don't think it is possible, Maybe Pavel or Jens
>>> could help (added to CC). Basically as long as
>>> fuse_uring_async_stop_queues() runs we do not have completed all
>>> io-uring commands via io_uring_cmd_done() and as long as we do not have
>>> completed these io-uring commands.
>>
>> If I understand the question right, yes, fuse io_uring cmd requests hold
>> a reference to the fuse file, so until you complete them the file will
>> not get released.
> 
> 
> Sorry, had totally messed up the phrase, can't read it myself.
> 
> What I mean is that the io-uring was set up with /dev/fuse as file and
> as long as fuse holds non-completed 'struct io_uring_cmd *cmd' objects
> there is a reference on the /dev/fuse fd, which blocks the call of
> fuse_dev_release().

Yep, that's right

-- 
Pavel Begunkov

