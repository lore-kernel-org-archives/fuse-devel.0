Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE122F1FC7
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929667; cv=pass; b=AFuS/8Ev/BD73HKf+aEfgHnRlU4qfmiwamJdC9l+Yn5UgclLhurI/7XnNYkbFzzKzf6p9xxioEEvYz/ixfyC08sJ3DS6llRCCNNiWEeb+VexgOFOitsnNP57SMqZoViracUPucSH6Nk3SzrRk2DmHEcm089J1hydLrfXLegqk0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929667; c=relaxed/simple;
	bh=ZTFDX2Y5X/u5PrIiEY4oYQusbXnMRn6UB3PQ0KhL9js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YR/GZ3/gTSCaIKPX7lSqDWpP7xiHeaEJZC/Adz3FcvSzJ+4Nlmmoqzua5F5vXx28Ibj860pOabF/3/9oFifjg3KqM0D5hRt8L/QcrXzHQM+Wx1MwvHTzpUfOsO3PmYWA5SjC0UaugGMrbCKqfivV3tqImprgKvnNcyhCYLEP3Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=erB/6Itx; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="erB/6Itx"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8ec37d52c0dso481310685a.0
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 00:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776929665; cv=none;
        d=google.com; s=arc-20240605;
        b=ei2KNGYg/a4sSy3XWP9Ow0ZnlDkbgo42dyjz0Za0CPoQPISNMOJQhuT2KrLLtwPvjE
         xWKxhTE89A1sMMwWDIkiP8AZ5nuodWwIV3vSslieY56iFR8WmBC/n2pWTuu71aIUoC/a
         v2S3uCrhWto5iBhjzYkw1zq7bZf83ml6Ua8B+qXo/esWTpD9E+IjhpdLdMos7nxPtRQi
         O8nUohEXsl/FlMlydKFOYmK4CT5D0pN1ReaxY5BfqQPDvbKLlXEIKpt019NW4FMT1npN
         9SuLXEX5Y57drSBIzbGloArnrTUAGyqxdwq/AAMcve0AGgOyEJNh8b3wzJQxEm4D1P+q
         tzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1Mdag09ds3b6m8n8Esri8WFKUeSOK/IyFAN6EmWBJ60=;
        fh=LYphJpetQZ0En9NTVNzzN2CUPouJVNewe5FwaemJUtw=;
        b=lCxGH+hf4ldK6DTy2nXmp6avhzDf/kxLK+ldnFlW8OPQKEurD0D6VcKw8HbhT/yUsu
         nc9s0H3kx8jArRmY/4IuiA9ZzYagxd9oUZ1U1rLSqYCKTTyLjQQO8CvA5qtRG1dGK9SO
         QwdYiTpqj7DkfUJMtS31mtNeCV7aa7MnV3fYBIUu01RFINzPjtg3hRPCcE3GaGcsu/gx
         9m+hNp8g9WtBqJPzPKs+/FyOebdy9TvP4q6lFWPBiZJ44o9laSrBIaq27dK/nImRVFFg
         94nd9M8IqHOcESJbBB+SmTJUAqnUao1mzSWOfjYoPvQe1iidU87XWJAG4yfXq88QKw4h
         RDCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776929665; x=1777534465; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mdag09ds3b6m8n8Esri8WFKUeSOK/IyFAN6EmWBJ60=;
        b=erB/6Itx7cA/dNcgjqhqtzLYdjaRezQ7v+0rrVeyI5WtsAIAcMVTTVg201y3Y7RebF
         MjF3dtzaVPGus4dHGDLfN0GtHWfYIZRrNNLwQzsIsqLTdZsB6PTcqeShkNRm7fv3wMK2
         UdT1rKFWv4HP5H/GnZXMTESeIct2FHKTabjxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776929665; x=1777534465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Mdag09ds3b6m8n8Esri8WFKUeSOK/IyFAN6EmWBJ60=;
        b=CPwmaRgt4oNzuNUsWWsjJVAvFIHQG5wV3di3+Qc3Pe8zr2+tRFB026CiSGHczfS7iw
         TxilA2u1hgc7o/usf6ksVQrtG+PhXF9VhmIeI3/XDk23DbCZPScGPozXG7/lBxkrOBSr
         IY8nv/+EtkMK2si0wf6fGl1ZnYFW1zhd5JbCQCW6chpt3BQo2hQTzH/HSHGNl9lljCKc
         8ofCgxtKfbS6G3skOEsNHxbTS1Wtpgf7pvKLHcXqs7Z9ttTrsd8BaJtYkStX9ryoqZyz
         XlbAB1KXteAyNni0QZj0p30IVSqrRz0hEcZW8dK9eNnqSV5ZaDXy6C6AUsCkJffdPMe1
         YRjg==
X-Gm-Message-State: AOJu0YycEbyz1ZIGYE9xHb9qdQka6llY2BwCty3oGICK6CgWb/zN/KIz
	xmJ2ln5ad9ntgnl1c0151kHmPTz0kd/8bUZ/3/mHtKuhu2bJL27aPYASj+XEAOyP2vFN/7D8AsC
	Gv/fiZdB2SoDVdx0g0wCS/oNdCUlwIdyJ6HdkRBF0miNCMc1joNM1VnE=
X-Gm-Gg: AeBDiesg6Tb31D73lW7i2Zpwj3ueVlXIFQbfX+Ug3Xcl9hAnQ1/DVu8Ooggt8YfIHe3
	XxCd4+PAj146zYvnS98TMkl2crR2KxtsL548sGwQpk7RUUh6SyOSjju3GD1VKe9a5t0qJ1deP+C
	Lgh49dx1c6kEPtqCuk5wUqTKfjNpGnhjHOehSYKBUuiM0tpEFJUkCt8NoKlq7Eotnm78aPcrtNM
	O7t+wtFGACLm6N07pG673D9EGip68HjM37OqPFfhJTqUIC3uvu3rk+0SnXsaRfmC3K4Oh2SwljP
	TLPpzt54BwLq3OCFTldMMy/NwIJHSJpvlDY5hBWDsP5bKyiXtvRbLhfJgzFAtg==
X-Received: by 2002:a05:622a:4d47:b0:50b:a9d3:2e20 with SMTP id
 d75a77b69052e-50e36c65b22mr396694591cf.49.1776929665234; Thu, 23 Apr 2026
 00:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422063538.GD7739@frogsfrogsfrogs>
In-Reply-To: <20260422063538.GD7739@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Apr 2026 09:34:13 +0200
X-Gm-Features: AQROBzAj-dP4cnh59AvC7VXEa1eR4-AhQ2_luMlBZWC_UTBYQn8qFjNPi8iBPPw
Message-ID: <CAJfpegtmXd51z0A4qAe=VSwXW2d-ds+NzBDfJcyr_p9MK-_a5A@mail.gmail.com>
Subject: Re: libfuse accepts subtypes with slashes in them??
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Bernd Schubert <bernd@bsbernd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 08:35, Darrick J. Wong <djwong@kernel.org> wrote:
>
> Hey everyone,
>
> So today I noticed that this happens on Debian 13:
>
> $ mount -t fuse./bin/ls /root/ /etc/shadow
> ls: cannot access 'rw,dev,suid': No such file or directory
> -rw-r----- 1 root 1345 Nov 18 10:38 /etc/shadow
>
> ls: cannot open directory '/root': Permission denied
>
> Uh... is that intentional?  It looks as though mount does:
>
> execve("/sbin/mount.fuse", ["/sbin/mount.fuse", "/root", "/etc/shadow", "-o", "rw", "-t", "fuse./bin/ls"]...)
>
> and then mount.fuse just trims off everything after the "fuse." and
> does:
>
> execve("/bin/sh", ["/bin/sh", "-c", "'/bin/ls' '/root' '/etc/shadow' '-o' 'rw,dev,suid'"]...)
>
> with the odd output that you see above.  Is that supposed to happen?
> Or should libfuse reject subtypes with path separators?

Probably should have done that.  But now this is probably abused and
would cause breakage if changed.

Thanks,
Miklos
